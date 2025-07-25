# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# PSRule.Rules.Azure module
#

Set-StrictMode -Version latest;

[PSRule.Rules.Azure.Configuration.PSRuleOption]::UseExecutionContext($ExecutionContext);

#
# Localization
#

#
# Public functions
#

#region Public functions

# .ExternalHelp PSRule.Rules.Azure-help.xml
function Export-AzRuleData {
    [CmdletBinding(SupportsShouldProcess = $True, DefaultParameterSetName = 'Default')]
    [OutputType([System.IO.FileInfo])]
    [OutputType([PSObject])]
    param (
        [Parameter(Position = 0, Mandatory = $False)]
        [String]$OutputPath = $PWD,

        # Filter by Subscription name or id
        [Parameter(Mandatory = $False, ParameterSetName = 'Default')]
        [String[]]$Subscription = $Null,

        # Filter by Tenant id
        [Parameter(Mandatory = $False, ParameterSetName = 'Default')]
        [String[]]$Tenant = $Null,

        # Filter by Resource Group name
        [Parameter(Mandatory = $False)]
        [String[]]$ResourceGroupName = $Null,

        # Filter by Tag
        [Parameter(Mandatory = $False)]
        [Hashtable]$Tag,

        [Parameter(Mandatory = $False)]
        [Switch]$PassThru = $False,

        [Parameter(Mandatory = $False, ParameterSetName = 'All')]
        [Switch]$All = $False,

        [Parameter(Mandatory = $False, ParameterSetName = 'Default')]
        [Switch]$SkipDiscovery,

        [Parameter(Mandatory = $False)]
        [Switch]$ExportSecurityAlerts,

        [Parameter(Mandatory = $False, ParameterSetName = 'Default', ValueFromPipeline = $True)]
        [string[]]$ResourceId
    )
    begin {
        $watch = [System.Diagnostics.Stopwatch]::new();
        $watch.Start();
        Write-Verbose -Message "[Export-AzRuleData] BEGIN::";

        $Option = [PSRule.Rules.Azure.Configuration.PSRuleOption]::FromFileOrDefault($PWD);
        $Option.Output.Path = $OutputPath;

        # Build the pipeline
        $builder = [PSRule.Rules.Azure.Pipeline.PipelineBuilder]::ResourceData($Option);
        $builder.AccessToken({ param($TenantId) $t = (Get-AzAccessToken -TenantId $TenantId -AsSecureString); return [PSRule.Rules.Azure.Pipeline.AccessToken]::new($t.Token, $t.ExpiresOn, $t.TenantId); });
        if ($ExportSecurityAlerts) {
            Write-Verbose -Message "[Export-AzRuleData] -- Exporting security alerts.";
            $builder.SecurityAlerts();
        }
        else {
            Write-Verbose -Message "[Export-AzRuleData] -- Not exporting security alerts.";
        }

        # Get subscriptions
        if (-not $SkipDiscovery) {
            $contextSubscriptions = @(FindAzureContext -Subscription $Subscription -Tenant $Tenant -All:$All -Verbose:$VerbosePreference | ForEach-Object {
                [PSRule.Rules.Azure.Pipeline.ExportSubscriptionScope]::new($_.Subscription.Id, $_.Tenant.Id)
            });
            if ($Null -eq $contextSubscriptions -or $contextSubscriptions.Length -eq 0) {
                return;
            }

            # Bind to subscription context
            $builder.Subscription($contextSubscriptions)
        }
        else {
            Write-Verbose -Message "[Export-AzRuleData] -- Discovery of resources will be skipped.";
        }

        if (!(Test-Path -Path $OutputPath)) {
            if ($PSCmdlet.ShouldProcess('Create output directory', $OutputPath)) {
                $Null = New-Item -Path $OutputPath -ItemType Directory -Force;
            }
        }

        # Bind to resource group
        if ($PSBoundParameters.ContainsKey('ResourceGroupName')) {
            Write-Verbose -Message "[Export-AzRuleData] -- Resources and resource groups will be filtered by resource group.";
            $builder.ResourceGroup($ResourceGroupName);
        }
        # Bind to tag
        if ($PSBoundParameters.ContainsKey('Tag')) {
            Write-Verbose -Message "[Export-AzRuleData] -- Resources and resource groups will be filtered by tag.";
            $builder.Tag($Tag);
        }
        # Bind to pass thru
        if (-not $PassThru) {
            Write-Verbose -Message "[Export-AzRuleData] -- Using the output path: $OutputPath";
            $builder.OutputPath($OutputPath);
        }
        # Bind to default tenant
        $defaultTenant = (Get-AzContext).Tenant.Id;
        if ($Null -ne $defaultTenant) {
            Write-Verbose -Message "[Export-AzRuleData] -- Using the default tenant: $defaultTenant";
            $builder.TenantId($defaultTenant);
        }

        $builder.UseCommandRuntime($PSCmdlet);
        $builder.UseExecutionContext($ExecutionContext);
        try {
            $pipeline = $builder.Build();
            $pipeline.Begin();
        }
        catch {
            $pipeline.Dispose();
        }
    }
    process {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                if ($Null -ne $ResourceId -and $ResourceId.Length -gt 0) {
                    foreach ($id in $ResourceId) {
                        $pipeline.Process($id);
                    }
                }
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    end {
        Write-Verbose -Message "[Export-AzRuleData] -- Completing export.";
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $result = $pipeline.End();
                if ($PassThru) {
                    $result | ConvertFrom-Json;
                }
                else {
                    $result;
                }
            }
            finally {
                $pipeline.Dispose();
            }
        }
        $watch.Stop();
        Write-Verbose -Message "[Export-AzRuleData] END:: - $($watch.Elapsed)";
    }
}

# .ExternalHelp PSRule.Rules.Azure-help.xml
function Export-AzRuleTemplateData {
    [CmdletBinding(DefaultParameterSetName = "Template")]
    [OutputType([System.IO.FileInfo])]
    [OutputType([PSObject])]
    param (
        [Parameter(Position = 0, Mandatory = $False)]
        [String]$Name,

        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True, ParameterSetName = "Template")]
        [String]$TemplateFile,

        [Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True, ParameterSetName = "Template")]
        [Alias('TemplateParameterFile')]
        [String[]]$ParameterFile,

        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True, ParameterSetName = "Source")]
        [Alias('f')]
        [Alias('FullName')]
        [String]$SourceFile,

        [Parameter(Mandatory = $False)]
        [Alias('ResourceGroupName')]
        [PSRule.Rules.Azure.Configuration.ResourceGroupReference]$ResourceGroup,

        [Parameter(Mandatory = $False)]
        [PSRule.Rules.Azure.Configuration.SubscriptionReference]$Subscription,

        [Parameter(Mandatory = $False)]
        [String]$OutputPath = $PWD,

        [Parameter(Mandatory = $False)]
        [Switch]$PassThru = $False
    )
    begin {
        Write-Verbose -Message '[Export-AzRuleTemplateData] BEGIN::';
        if ($MyInvocation.InvocationName -eq 'Export-AzTemplateRuleData') {
            Write-Warning -Message "The cmdlet 'Export-AzTemplateRuleData' is has been renamed to 'Export-AzRuleTemplateData'. Use of 'Export-AzTemplateRuleData' is deprecated and will be removed in the next major version."
        }

        $Option = [PSRule.Rules.Azure.Configuration.PSRuleOption]::FromFileOrDefault($PWD);
        $Option.Output.Path = $OutputPath;

        # Build the pipeline
        $builder = [PSRule.Rules.Azure.Pipeline.PipelineBuilder]::Template($Option);
        $builder.Deployment($Name);
        $builder.PassThru($PassThru);

        # Bind to subscription context
        if ($PSBoundParameters.ContainsKey('Subscription')) {
            $subscriptionOption = GetSubscription -InputObject $Subscription -ErrorAction SilentlyContinue;
            if ($Null -ne $subscriptionOption) {
                $builder.Subscription($subscriptionOption);
            }
        }
        # Bind to resource group
        if ($PSBoundParameters.ContainsKey('ResourceGroup')) {
            $resourceGroupOption = GetResourceGroup -InputObject $ResourceGroup -ErrorAction SilentlyContinue;
            if ($Null -ne $resourceGroupOption) {
                $builder.ResourceGroup($resourceGroupOption);
            }
        }

        $builder.UseCommandRuntime($PSCmdlet);
        $builder.UseExecutionContext($ExecutionContext);
        try {
            $pipeline = $builder.Build();
            $pipeline.Begin();
        }
        catch {
            $pipeline.Dispose();
        }
    }
    process {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {

                if ($PSCmdlet.ParameterSetName -eq 'Source') {
                    $source = [PSRule.Rules.Azure.Pipeline.TemplateSource]::new($SourceFile);
                    $pipeline.Process($source);
                }
                else {
                    $source = [PSRule.Rules.Azure.Pipeline.TemplateSource]::new($TemplateFile, $ParameterFile);
                    $pipeline.Process($source);
                }
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    end {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.End();
            }
            finally {
                $pipeline.Dispose();
            }
        }
        Write-Verbose -Message '[Export-AzRuleTemplateData] END::';
    }
}

# .ExternalHelp PSRule.Rules.Azure-help.xml
function Get-AzRuleTemplateLink {
    [CmdletBinding()]
    [OutputType([PSRule.Rules.Azure.Data.Metadata.ITemplateLink])]
    param (
        [Parameter(Position = 1, Mandatory = $False, ValueFromPipelineByPropertyName = $True)]
        [Alias('f', 'TemplateParameterFile', 'FullName')]
        [SupportsWildcards()]
        [String[]]$InputPath = '*.parameters.json',

        [Parameter(Mandatory = $False)]
        [Switch]$SkipUnlinked,

        [Parameter(Position = 0, Mandatory = $False)]
        [Alias('p')]
        [String]$Path = $PWD
    )
    begin {
        Write-Verbose -Message '[Get-AzRuleTemplateLink] BEGIN::';

        # Build the pipeline
        $builder = [PSRule.Rules.Azure.Pipeline.PipelineBuilder]::TemplateLink($Path);
        $builder.SkipUnlinked($SkipUnlinked);
        $builder.UseCommandRuntime($PSCmdlet);
        $builder.UseExecutionContext($ExecutionContext);
        $pipeline = $builder.Build();
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.Begin();
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    process {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                foreach ($p in $InputPath) {
                    $pipeline.Process($p);
                }
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    end {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.End();
            }
            finally {
                $pipeline.Dispose();
            }
        }
        Write-Verbose -Message '[Get-AzRuleTemplateLink] END::';
    }
}

function Export-AzPolicyAssignmentData {
    [CmdletBinding(SupportsShouldProcess = $True, DefaultParameterSetName = 'Default')]
    [OutputType([System.IO.FileInfo])]
    [OutputType([PSObject])]
    param (
        # Name of policy assignment
        [Parameter(ParameterSetName = 'Name', Mandatory = $False)]
        [String]$Name,

        # Fully qualified resource ID of policy assignment
        [Parameter(ParameterSetName = 'Id', Mandatory = $True)]
        [Alias('AssignmentId')]
        [String[]]$Id,

        # Specifies assignment policy scope
        [Parameter(ParameterSetName = 'Name', Mandatory = $False)]
        [Parameter(ParameterSetName = 'IncludeDescendent', Mandatory = $False)]
        [String[]]$Scope,

        # Specifies the policy definition ID of the policy assignment
        [Parameter(ParameterSetName = 'Name', Mandatory = $False)]
        [Parameter(ParameterSetName = 'Id', Mandatory = $False)]
        [String]$PolicyDefinitionId,

        # Include all assignments related to given scope
        [Parameter(ParameterSetName = 'IncludeDescendent', Mandatory = $True)]
        [Switch]$IncludeDescendent = $False,

        [Parameter(Mandatory = $False)]
        [String]$OutputPath = $PWD,

        [Parameter(Mandatory = $False)]
        [String]$TenantId,

        [Parameter(Mandatory = $False)]
        [Switch]$PassThru = $False
    )
    begin {
        $watch = [System.Diagnostics.Stopwatch]::new();
        $watch.Start();
        Write-Verbose -Message '[Export-AzPolicyAssignmentData] BEGIN::';

        $context = GetAzureContext -ErrorAction SilentlyContinue

        if ($Null -eq $context) {
            Write-Error -Message 'Could not find an existing context. Use Connect-AzAccount to establish a PowerShell context with Azure.';
            return;
        }

        $option = [PSRule.Rules.Azure.Configuration.PSRuleOption]::FromFileOrDefault($PWD);
        $option.Output.Path = $OutputPath;

        # Build the pipeline
        $builder = [PSRule.Rules.Azure.Pipeline.PipelineBuilder]::AssignmentData($option);
        $builder.PassThru($PassThru);
        $builder.AccessToken({ param($TenantId) $t = (Get-AzAccessToken -TenantId $TenantId -AsSecureString); return [PSRule.Rules.Azure.Pipeline.AccessToken]::new($t.Token, $t.ExpiresOn, $t.TenantId); });

        # Bind to specified assignments by ID.
        if ($PSBoundParameters.ContainsKey('Id')) {
            $builder.AssignmentId($Id);
        }
        # Bind to specified scopes.
        elseif ($PSBoundParameters.ContainsKey('Scope')) {
            $builder.Scope($Scope);
        }
        else {
            # Use the current context subscription scope.
            Write-Verbose -Message "[Export-AzPolicyAssignmentData] -- Using the current subscription scope: /subscriptions/$($context.Subscription.Id)";
            $builder.Scope("/subscriptions/$($context.Subscription.Id)");
        }

        # Bind to configured tenant.
        if ($PSBoundParameters.ContainsKey('TenantId')) {
            $builder.TenantId($TenantId);
        }

        # Bind to pass thru.
        if (-not $PassThru) {
            Write-Verbose -Message "[Export-AzPolicyAssignmentData] -- Using the output path: $OutputPath";
            $builder.OutputPath($OutputPath);
        }
        # Bind to default tenant.
        $defaultTenant = $context.Tenant.Id;
        if ($Null -ne $defaultTenant -and !$PSBoundParameters.ContainsKey('TenantId')) {
            Write-Verbose -Message "[Export-AzPolicyAssignmentData] -- Using the default tenant: $defaultTenant";
            $builder.TenantId($defaultTenant);
        }

        $builder.UseCommandRuntime($PSCmdlet);
        $builder.UseExecutionContext($ExecutionContext);
        try {
            $pipeline = $builder.Build();
            $pipeline.Begin();
        }
        catch {
            if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
                $pipeline.Dispose();
            }

            throw;
        }
    }
    process {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.Process($Null);
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    end {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.End();
            }
            finally {
                $pipeline.Dispose();
            }
        }
        $watch.Stop();
        Write-Verbose -Message "[Export-AzPolicyAssignmentData] END:: - $($watch.Elapsed)";
    }
}

function Export-AzPolicyAssignmentRuleData {
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([System.IO.FileInfo])]
    [OutputType([PSObject])]
    param (
        # Name of Policy assignment
        [Parameter(Mandatory = $False)]
        [String]$Name,

        # Assignment file path
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [String]$AssignmentFile,

        [Parameter(Mandatory = $False)]
        [Alias('ResourceGroupName')]
        [PSRule.Rules.Azure.Configuration.ResourceGroupReference]$ResourceGroup,

        [Parameter(Mandatory = $False)]
        [PSRule.Rules.Azure.Configuration.SubscriptionReference]$Subscription,

        [Parameter(Mandatory = $False)]
        [String]$OutputPath = $PWD,

        [Parameter(Mandatory = $False)]
        [String]$RulePrefix,

        [Parameter(Mandatory = $False)]
        [Switch]$PassThru = $False,

        [Parameter(Mandatory = $False)]
        [Switch]$KeepDuplicates = $False
    )
    begin {
        Write-Verbose -Message '[Export-AzPolicyAssignmentRuleData] BEGIN::';

        $option = [PSRule.Rules.Azure.Configuration.PSRuleOption]::FromFileOrDefault($PWD);
        $option.Output.Path = $OutputPath;

        if ($PSBoundParameters.ContainsKey('RulePrefix')) {
            $option.Configuration.PolicyRulePrefix = $RulePrefix
        }

        # Build the pipeline
        $builder = [PSRule.Rules.Azure.Pipeline.PipelineBuilder]::Assignment($option);
        $builder.Assignment($Name);
        $builder.PassThru($PassThru);
        $builder.KeepDuplicates($KeepDuplicates);

        # Bind to subscription context
        if ($PSBoundParameters.ContainsKey('Subscription')) {
            $subscriptionOption = GetSubscription -InputObject $Subscription -ErrorAction SilentlyContinue;
            if ($Null -ne $subscriptionOption) {
                $builder.Subscription($subscriptionOption);
            }
        }
        # Bind to resource group
        if ($PSBoundParameters.ContainsKey('ResourceGroup')) {
            $resourceGroupOption = GetResourceGroup -InputObject $ResourceGroup -ErrorAction SilentlyContinue;
            if ($Null -ne $resourceGroupOption) {
                $builder.ResourceGroup($resourceGroupOption);
            }
        }

        $builder.UseCommandRuntime($PSCmdlet);
        $builder.UseExecutionContext($ExecutionContext);
        try {
            $pipeline = $builder.Build();
            $pipeline.Begin();
        }
        catch {
            $pipeline.Dispose();
        }
    }
    process {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $source = [PSRule.Rules.Azure.Pipeline.PolicyAssignmentSource]::new($AssignmentFile);
                $pipeline.Process($source);
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    end {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.End();
            }
            finally {
                $pipeline.Dispose();
            }
        }
        Write-Verbose -Message '[Export-AzPolicyAssignmentRuleData] END::';
    }
}

function Get-AzPolicyAssignmentDataSource {
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([PSRule.Rules.Azure.Pipeline.PolicyAssignmentSource])]
    param (
        [Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)]
        [Alias('f', 'AssignmentFile', 'FullName')]
        [SupportsWildcards()]
        [String[]]$InputPath = '*.assignment.json',

        [Parameter(Mandatory = $False)]
        [Alias('p')]
        [String]$Path = $PWD
    )
    begin {
        Write-Verbose -Message '[Get-AzPolicyAssignmentDataSource] BEGIN::';

        # Build the pipeline
        $builder = [PSRule.Rules.Azure.Pipeline.PipelineBuilder]::AssignmentSearch($Path);
        $builder.UseCommandRuntime($PSCmdlet);
        $builder.UseExecutionContext($ExecutionContext);
        $pipeline = $builder.Build();
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.Begin();
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    process {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                foreach ($p in $InputPath) {
                    $pipeline.Process($p);
                }
            }
            catch {
                $pipeline.Dispose();
                throw;
            }
        }
    }
    end {
        if ($Null -ne (Get-Variable -Name pipeline -ErrorAction SilentlyContinue)) {
            try {
                $pipeline.End();
            }
            finally {
                $pipeline.Dispose();
            }
        }
        Write-Verbose -Message '[Get-AzPolicyAssignmentDataSource] END::';
    }
}

#endregion Public functions

#
# Helper functions
#

function GetDefaultSubscriptionScope {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)]
        [Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer]$Context
    )
    process {
        return [string]::Concat('/subscriptions/', $context.Subscription.Id);
    }
}

function GetResourceGroup {
    [CmdletBinding()]
    [OutputType([PSRule.Rules.Azure.Configuration.ResourceGroupOption])]
    param (
        [Parameter(Mandatory = $True)]
        [PSRule.Rules.Azure.Configuration.ResourceGroupReference]$InputObject
    )
    process {
        $result = $InputObject.ToResourceGroupOption();
        if ($InputObject.FromName) {
            $o = Get-AzResourceGroup -Name $InputObject.Name -ErrorAction SilentlyContinue;
            if ($Null -ne $o) {
                $result.Name = $o.ResourceGroupName
                $result.Location = $o.Location
                $result.ManagedBy = $o.ManagedBy
                $result.Properties.ProvisioningState = $o.ProvisioningState
                $result.Tags = $o.Tags
            }
        }
        return $result;
    }
}

function GetSubscription {
    [CmdletBinding()]
    [OutputType([PSRule.Rules.Azure.Configuration.SubscriptionOption])]
    param (
        [Parameter(Mandatory = $True)]
        [PSRule.Rules.Azure.Configuration.SubscriptionReference]$InputObject
    )
    process {
        $result = $InputObject.ToSubscriptionOption();
        if ($InputObject.FromName) {
            $o = (Set-AzContext -Subscription $InputObject.DisplayName -ErrorAction SilentlyContinue).Subscription;
            if ($Null -ne $o) {
                $result.DisplayName = $o.Name
                $result.SubscriptionId = $o.SubscriptionId
                $result.State = $o.State
                $result.TenantId = $o.TenantId
            }
        }
        return $result;
    }
}

function FindAzureContext {
    [CmdletBinding()]
    [OutputType([Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer[]])]
    param (
        [Parameter(Mandatory = $False)]
        [String[]]$Subscription = $Null,

        [Parameter(Mandatory = $False)]
        [String[]]$Tenant = $Null,

        [Parameter(Mandatory = $False)]
        [System.Boolean]$All = $False
    )
    process {
        $listAvailable = $False;
        if ($Null -ne $Subscription -or $Null -ne $Tenant -or $All) {
            $listAvailable = $True;
        }

        # Get subscription contexts
        $context = @(GetAzureContext -ListAvailable:$listAvailable);
        if ($Null -eq $context -and $context.Length -gt 0) {
            Write-Error -Message 'Could not find an existing context. Use Connect-AzAccount to establish a PowerShell context with Azure.';
            return;
        }

        try {
            Write-Verbose "[Context] -- Found ($($context.Length)) subscription contexts";
            $filteredContext = @($context | ForEach-Object -Process {
                    if (
                    ($Null -eq $Tenant -or $Tenant.Length -eq 0 -or ($_.Tenant.Id -in $Tenant)) -and
                    ($Null -eq $Subscription -or $Subscription.Length -eq 0 -or ($_.Subscription.Id -in $Subscription) -or ($_.Subscription.Name -in $Subscription))
                    ) {
                        $_;
                        Write-Verbose "[Context] -- Using subscription: $($_.Subscription.Name), Id=$($_.Subscription.Id), TenantId=$($_.Tenant.Id)";
                    }
                })

            Write-Verbose "[Context] -- Using [$($filteredContext.Length)/$($context.Length)] subscription contexts";

            return $filteredContext;
        }
        catch {
            Write-Error -Message "Failed to filter contexts. Error: $_";
        }
    }
}

function GetAzureContext {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $False)]
        [System.Boolean]$ListAvailable = $False
    )
    process {
        $getParams = @{ };
        if ($ListAvailable) {
            $getParams['ListAvailable'] = $True;
        }

        # Get contexts
        return Get-AzContext @getParams;
    }
}

#
# Export module
#

New-Alias -Name 'Export-AzTemplateRuleData' -Value 'Export-AzRuleTemplateData' -Force;

Export-ModuleMember -Function @(
    'Export-AzRuleData'
    'Export-AzRuleTemplateData'
    'Get-AzRuleTemplateLink'
    'Export-AzPolicyAssignmentData'
    'Export-AzPolicyAssignmentRuleData'
    'Get-AzPolicyAssignmentDataSource'
);

Export-ModuleMember -Alias @(
    'Export-AzTemplateRuleData'
);
