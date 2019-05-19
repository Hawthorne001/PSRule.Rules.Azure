#
# Unit tests for module cmdlets
#

[CmdletBinding()]
param (

)

# Setup error handling
$ErrorActionPreference = 'Stop';
Set-StrictMode -Version latest;

if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = 'Continue';
}

# Setup tests paths
$rootPath = $PWD;
Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.Azure) -Force;
$outputPath = Join-Path -Path $rootPath -ChildPath out/tests/PSRule.Rules.Azure.Tests/Cmdlet;
Remove-Item -Path $outputPath -Force -Recurse -Confirm:$False -ErrorAction Ignore;
$Null = New-Item -Path $outputPath -ItemType Directory -Force;

#region Mocks

function MockContext {
    process {
        return @(
            (New-Object -TypeName Microsoft.Azure.Commands.Profile.Models.Core.PSAzureContext -ArgumentList @(
                [PSCustomObject]@{
                    Subscription = [PSCustomObject]@{
                        Id = '00000000-0000-0000-0000-000000000001'
                        Name = 'Test subscription 1'
                        State = 'Enabled'
                    }
                    Tenant = [PSCustomObject]@{
                        Id = '00000000-0000-0000-0000-000000000001'
                    }
                }
            )),
            (New-Object -TypeName Microsoft.Azure.Commands.Profile.Models.Core.PSAzureContext -ArgumentList @(
                [PSCustomObject]@{
                    Subscription = [PSCustomObject]@{
                        Id = '00000000-0000-0000-0000-000000000002'
                        Name = 'Test subscription 2'
                        State = 'Enabled'
                    }
                    Tenant = [PSCustomObject]@{
                        Id = '00000000-0000-0000-0000-000000000002'
                    }
                }
            ))
            (New-Object -TypeName Microsoft.Azure.Commands.Profile.Models.Core.PSAzureContext -ArgumentList @(
                [PSCustomObject]@{
                    Subscription = [PSCustomObject]@{
                        Id = '00000000-0000-0000-0000-000000000003'
                        Name = 'Test subscription 3'
                        State = 'Enabled'
                    }
                    Tenant = [PSCustomObject]@{
                        Id = '00000000-0000-0000-0000-000000000002'
                    }
                }
            ))
        )
    }
}

#endregion Mocks

#region Export-AzRuleData

Describe 'Export-AzRuleData' -Tag 'Cmdlet' {
    Context 'With defaults' {
        Mock -CommandName 'FindAzureContext' -ModuleName 'PSRule.Rules.Azure' -Verifiable -MockWith ${function:MockContext};
        Mock -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure' -Verifiable -MockWith {
            return [PSCustomObject]@{
                Name = 'Resource1'
            }
        }

        It 'Exports resources' {
            $result = @(Export-AzRuleData -OutputPath $outputPath);

            Assert-VerifiableMock;
            Assert-MockCalled -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure' -Times 3;
            $result.Length | SHould -Be 3;
            $result | Should -BeOfType System.IO.FileInfo;
        }

        It 'Return resources' {
            $result = @(Export-AzRuleData -PassThru);

            $result.Length | SHould -Be 3;
            $result | Should -BeOfType PSCustomObject;
            $result.Name | Should -BeIn 'Resource1';
        }
    }

    Context 'With filters' {
        Mock -CommandName 'ExportAzureResource' -ModuleName 'PSRule.Rules.Azure';
        Mock -CommandName 'GetAzureContext' -ModuleName 'PSRule.Rules.Azure' -MockWith ${function:MockContext};

        It 'Uses subscription name filter' {
            Mock -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure';
            $Null = Export-AzRuleData -Subscription 'Test subscription 1';
            Assert-MockCalled -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure' -Times 1;
        }

        It 'Uses subscription Id filter' {
            Mock -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure';
            $Null = Export-AzRuleData -Subscription '00000000-0000-0000-0000-000000000002';
            Assert-MockCalled -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure' -Times 1;
        }

        It 'Uses tenant Id filter' {
            Mock -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure';
            $Null = Export-AzRuleData -Tenant '00000000-0000-0000-0000-000000000002';
            Assert-MockCalled -CommandName 'GetAzureResource' -ModuleName 'PSRule.Rules.Azure' -Times 2;
        }
    }
}

#endregion Export-AzRuleData