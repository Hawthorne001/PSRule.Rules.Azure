# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Validation rules for Azure AI.
#

# Synopsis: Azure AI Foundry accounts without a standard naming convention may be difficult to identify and manage.
Rule 'Azure.AI.FoundryNaming' -Ref 'AZR-000460' -Alias 'Azure.AI.Naming' -Type 'Microsoft.CognitiveServices/accounts' -With 'Azure.AI.AIServices' -If { $Configuration['AZURE_AI_SERVICES_NAME_FORMAT'] -ne '' } -Tag @{ release = 'GA'; ruleSet = '2025_06'; 'Azure.WAF/pillar' = 'Operational Excellence' } -Labels @{ 'Azure.CAF' = 'naming' } {
    $Assert.Match($PSRule, 'TargetName', $Configuration.AZURE_AI_SERVICES_NAME_FORMAT, $True);
}
