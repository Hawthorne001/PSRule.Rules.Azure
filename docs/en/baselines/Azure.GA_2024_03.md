---
export: true
moduleVersion: v1.35.0
obsolete: true
generated: true
---

# Azure.GA_2024_03

<!-- OBSOLETE -->

Include rules released March 2024 or prior for Azure GA features.

## Rules

The following rules are included within the `Azure.GA_2024_03` baseline.

This baseline includes a total of 392 rules.

Name | Synopsis | Severity
---- | -------- | --------
[Azure.ACR.AdminUser](../rules/Azure.ACR.AdminUser.md) | The local admin account allows depersonalized access to a container registry using a shared secret. | Critical
[Azure.ACR.ContainerScan](../rules/Azure.ACR.ContainerScan.md) | Container images or their base images may have vulnerabilities discovered after they are built. | Critical
[Azure.ACR.Firewall](../rules/Azure.ACR.Firewall.md) | Container Registry without restrictions can be accessed from any network location including the Internet. | Important
[Azure.ACR.GeoReplica](../rules/Azure.ACR.GeoReplica.md) | Applications or infrastructure relying on a container image may fail if the registry is not available at the time they start. | Important
[Azure.ACR.ImageHealth](../rules/Azure.ACR.ImageHealth.md) | Remove container images with known vulnerabilities. | Critical
[Azure.ACR.MinSku](../rules/Azure.ACR.MinSku.md) | ACR should use the Premium or Standard SKU for production deployments. | Important
[Azure.ACR.Name](../rules/Azure.ACR.Name.md) | Container registry names should meet naming requirements. | Awareness
[Azure.ACR.Usage](../rules/Azure.ACR.Usage.md) | Regularly remove deprecated and unneeded images to reduce storage usage. | Important
[Azure.ADX.DiskEncryption](../rules/Azure.ADX.DiskEncryption.md) | Use disk encryption for Azure Data Explorer (ADX) clusters. | Important
[Azure.ADX.ManagedIdentity](../rules/Azure.ADX.ManagedIdentity.md) | Configure Data Explorer clusters to use managed identities to access Azure resources securely. | Important
[Azure.ADX.SLA](../rules/Azure.ADX.SLA.md) | Use SKUs that include an SLA when configuring Azure Data Explorer (ADX) clusters. | Important
[Azure.ADX.Usage](../rules/Azure.ADX.Usage.md) | Regularly remove unused resources to reduce costs. | Important
[Azure.AI.DisableLocalAuth](../rules/Azure.AI.DisableLocalAuth.md) | Access keys allow depersonalized access to Azure AI using a shared secret. | Important
[Azure.AI.ManagedIdentity](../rules/Azure.AI.ManagedIdentity.md) | Configure managed identities to access Azure resources. | Important
[Azure.AI.PrivateEndpoints](../rules/Azure.AI.PrivateEndpoints.md) | Use Private Endpoints to access Azure AI services accounts. | Important
[Azure.AI.PublicAccess](../rules/Azure.AI.PublicAccess.md) | Restrict access of Azure AI services to authorized virtual networks. | Important
[Azure.AKS.AuditLogs](../rules/Azure.AKS.AuditLogs.md) | AKS clusters should collect security-based audit logs to assess and monitor the compliance status of workloads. | Important
[Azure.AKS.AuthorizedIPs](../rules/Azure.AKS.AuthorizedIPs.md) | Restrict access to API server endpoints to authorized IP addresses. | Important
[Azure.AKS.AutoScaling](../rules/Azure.AKS.AutoScaling.md) | Use autoscaling to scale clusters based on workload requirements. | Important
[Azure.AKS.AutoUpgrade](../rules/Azure.AKS.AutoUpgrade.md) | New versions of Kubernetes are released regularly. Upgrading each release manually can add operational overhead without realizing equivalent value. | Important
[Azure.AKS.AvailabilityZone](../rules/Azure.AKS.AvailabilityZone.md) | AKS clusters deployed with virtual machine scale sets should use availability zones in supported regions for high availability. | Important
[Azure.AKS.AzurePolicyAddOn](../rules/Azure.AKS.AzurePolicyAddOn.md) | Configure Azure Kubernetes Service (AKS) clusters to use Azure Policy Add-on for Kubernetes. | Important
[Azure.AKS.AzureRBAC](../rules/Azure.AKS.AzureRBAC.md) | Use Azure RBAC for Kubernetes Authorization with AKS clusters. | Important
[Azure.AKS.CNISubnetSize](../rules/Azure.AKS.CNISubnetSize.md) | AKS clusters using Azure CNI should use large subnets to reduce IP exhaustion issues. | Important
[Azure.AKS.ContainerInsights](../rules/Azure.AKS.ContainerInsights.md) | Enable Container insights to monitor AKS cluster workloads. | Important
[Azure.AKS.DefenderProfile](../rules/Azure.AKS.DefenderProfile.md) | Enable the Defender profile with Azure Kubernetes Service (AKS) cluster. | Important
[Azure.AKS.DNSPrefix](../rules/Azure.AKS.DNSPrefix.md) | Azure Kubernetes Service (AKS) cluster DNS prefix should meet naming requirements. | Awareness
[Azure.AKS.EphemeralOSDisk](../rules/Azure.AKS.EphemeralOSDisk.md) | AKS clusters should use ephemeral OS disks which can provide lower read/write latency, along with faster node scaling and cluster upgrades. | Important
[Azure.AKS.HttpAppRouting](../rules/Azure.AKS.HttpAppRouting.md) | Disable HTTP application routing add-on in AKS clusters. | Important
[Azure.AKS.LocalAccounts](../rules/Azure.AKS.LocalAccounts.md) | Enforce named user accounts with RBAC assigned permissions. | Important
[Azure.AKS.ManagedAAD](../rules/Azure.AKS.ManagedAAD.md) | Use AKS-managed Azure AD to simplify authorization and improve security. | Important
[Azure.AKS.ManagedIdentity](../rules/Azure.AKS.ManagedIdentity.md) | Configure AKS clusters to use managed identities for managing cluster infrastructure. | Important
[Azure.AKS.MinNodeCount](../rules/Azure.AKS.MinNodeCount.md) | AKS clusters should have minimum number of system nodes for failover and updates. | Important
[Azure.AKS.MinUserPoolNodes](../rules/Azure.AKS.MinUserPoolNodes.md) | User node pools in an AKS cluster should have a minimum number of nodes for failover and updates. | Important
[Azure.AKS.Name](../rules/Azure.AKS.Name.md) | Azure Kubernetes Service (AKS) cluster names should meet naming requirements. | Awareness
[Azure.AKS.NetworkPolicy](../rules/Azure.AKS.NetworkPolicy.md) | AKS clusters without inter-pod network restrictions may be permit unauthorized lateral movement. | Important
[Azure.AKS.NodeMinPods](../rules/Azure.AKS.NodeMinPods.md) | Azure Kubernetes Cluster (AKS) nodes should use a minimum number of pods. | Important
[Azure.AKS.PlatformLogs](../rules/Azure.AKS.PlatformLogs.md) | AKS clusters should collect platform diagnostic logs to monitor the state of workloads. | Important
[Azure.AKS.PoolScaleSet](../rules/Azure.AKS.PoolScaleSet.md) | Deploy AKS clusters with nodes pools based on VM scale sets. | Important
[Azure.AKS.PoolVersion](../rules/Azure.AKS.PoolVersion.md) | AKS node pools should match Kubernetes control plane version. | Important
[Azure.AKS.SecretStore](../rules/Azure.AKS.SecretStore.md) | Deploy AKS clusters with Secrets Store CSI Driver and store Secrets in Key Vault. | Important
[Azure.AKS.SecretStoreRotation](../rules/Azure.AKS.SecretStoreRotation.md) | Enable autorotation of Secrets Store CSI Driver secrets for AKS clusters. | Important
[Azure.AKS.StandardLB](../rules/Azure.AKS.StandardLB.md) | Azure Kubernetes Clusters (AKS) should use a Standard load balancer SKU. | Important
[Azure.AKS.UptimeSLA](../rules/Azure.AKS.UptimeSLA.md) | AKS clusters should have Uptime SLA enabled for a financially backed SLA. | Important
[Azure.AKS.UseRBAC](../rules/Azure.AKS.UseRBAC.md) | Deploy AKS cluster with role-based access control (RBAC) enabled. | Important
[Azure.AKS.Version](../rules/Azure.AKS.Version.md) | Older versions of Kubernetes may have known bugs or security vulnerabilities, and may have limited support. | Important
[Azure.APIM.APIDescriptors](../rules/Azure.APIM.APIDescriptors.md) | APIs should have a display name and description. | Awareness
[Azure.APIM.CertificateExpiry](../rules/Azure.APIM.CertificateExpiry.md) | Renew certificates used for custom domain bindings. | Important
[Azure.APIM.Ciphers](../rules/Azure.APIM.Ciphers.md) | API Management should not accept weak or deprecated ciphers for client or backend communication. | Critical
[Azure.APIM.CORSPolicy](../rules/Azure.APIM.CORSPolicy.md) | Avoid using wildcard for any configuration option in CORS policies. | Important
[Azure.APIM.DefenderCloud](../rules/Azure.APIM.DefenderCloud.md) | APIs published in Azure API Management should be onboarded to Microsoft Defender for APIs. | Critical
[Azure.APIM.EncryptValues](../rules/Azure.APIM.EncryptValues.md) | Encrypt all API Management named values with Key Vault secrets. | Important
[Azure.APIM.HTTPBackend](../rules/Azure.APIM.HTTPBackend.md) | Unencrypted communication could allow disclosure of information to an untrusted party. | Critical
[Azure.APIM.HTTPEndpoint](../rules/Azure.APIM.HTTPEndpoint.md) | Unencrypted communication could allow disclosure of information to an untrusted party. | Important
[Azure.APIM.ManagedIdentity](../rules/Azure.APIM.ManagedIdentity.md) | Configure managed identities to access Azure resources. | Important
[Azure.APIM.MinAPIVersion](../rules/Azure.APIM.MinAPIVersion.md) | API Management instances should limit control plane API calls to API Management with version '2021-08-01' or newer. | Important
[Azure.APIM.MultiRegionGateway](../rules/Azure.APIM.MultiRegionGateway.md) | API Management instances should have multi-region deployment gateways enabled. | Important
[Azure.APIM.Name](../rules/Azure.APIM.Name.md) | API Management service names should meet naming requirements. | Awareness
[Azure.APIM.PolicyBase](../rules/Azure.APIM.PolicyBase.md) | Base element for any policy element in a section should be configured. | Important
[Azure.APIM.ProductApproval](../rules/Azure.APIM.ProductApproval.md) | Configure products to require approval. | Important
[Azure.APIM.ProductDescriptors](../rules/Azure.APIM.ProductDescriptors.md) | API Management products should have a display name and description. | Awareness
[Azure.APIM.ProductSubscription](../rules/Azure.APIM.ProductSubscription.md) | Configure products to require a subscription. | Important
[Azure.APIM.Protocols](../rules/Azure.APIM.Protocols.md) | API Management should only accept a minimum of TLS 1.2 for client and backend communication. | Critical
[Azure.APIM.SampleProducts](../rules/Azure.APIM.SampleProducts.md) | API Management Services with default products configured may expose more APIs than intended. | Awareness
[Azure.AppConfig.AuditLogs](../rules/Azure.AppConfig.AuditLogs.md) | Ensure app configuration store audit diagnostic logs are enabled. | Important
[Azure.AppConfig.DisableLocalAuth](../rules/Azure.AppConfig.DisableLocalAuth.md) | Access keys allow depersonalized access to App Configuration using a shared secret. | Important
[Azure.AppConfig.GeoReplica](../rules/Azure.AppConfig.GeoReplica.md) | Replicate app configuration store across all points of presence for an application. | Important
[Azure.AppConfig.Name](../rules/Azure.AppConfig.Name.md) | App Configuration store names should meet naming requirements. | Awareness
[Azure.AppConfig.PurgeProtect](../rules/Azure.AppConfig.PurgeProtect.md) | Consider purge protection for app configuration store to ensure store cannot be purged in the retention period. | Important
[Azure.AppConfig.SKU](../rules/Azure.AppConfig.SKU.md) | App Configuration should use a minimum size of Standard. | Important
[Azure.AppGw.AvailabilityZone](../rules/Azure.AppGw.AvailabilityZone.md) | Application Gateway (App Gateway) should use availability zones in supported regions for improved resiliency. | Important
[Azure.AppGw.MigrateV2](../rules/Azure.AppGw.MigrateV2.md) | Use a Application Gateway v2 SKU. | Important
[Azure.AppGw.MinInstance](../rules/Azure.AppGw.MinInstance.md) | Application Gateways should use a minimum of two instances. | Important
[Azure.AppGw.MinSku](../rules/Azure.AppGw.MinSku.md) | Application Gateway should use a minimum instance size of Medium. | Important
[Azure.AppGw.Name](../rules/Azure.AppGw.Name.md) | Application Gateways should meet naming requirements. | Awareness
[Azure.AppGw.OWASP](../rules/Azure.AppGw.OWASP.md) | Application Gateway Web Application Firewall (WAF) should use OWASP 3.x rules. | Important
[Azure.AppGw.Prevention](../rules/Azure.AppGw.Prevention.md) | Internet exposed Application Gateways should use prevention mode to protect backend resources. | Critical
[Azure.AppGw.SSLPolicy](../rules/Azure.AppGw.SSLPolicy.md) | Application Gateway should only accept a minimum of TLS 1.2. | Critical
[Azure.AppGw.UseHTTPS](../rules/Azure.AppGw.UseHTTPS.md) | Application Gateways should only expose frontend HTTP endpoints over HTTPS. | Critical
[Azure.AppGw.UseWAF](../rules/Azure.AppGw.UseWAF.md) | Internet accessible Application Gateways should use protect endpoints with WAF. | Critical
[Azure.AppGw.WAFEnabled](../rules/Azure.AppGw.WAFEnabled.md) | Application Gateway Web Application Firewall (WAF) must be enabled to protect backend resources. | Critical
[Azure.AppGw.WAFRules](../rules/Azure.AppGw.WAFRules.md) | Application Gateway Web Application Firewall (WAF) should have all rules enabled. | Important
[Azure.AppGwWAF.Enabled](../rules/Azure.AppGwWAF.Enabled.md) | Application Gateway Web Application Firewall (WAF) must be enabled to protect backend resources. | Critical
[Azure.AppGwWAF.Exclusions](../rules/Azure.AppGwWAF.Exclusions.md) | Application Gateway Web Application Firewall (WAF) should have all rules enabled. | Critical
[Azure.AppGwWAF.PreventionMode](../rules/Azure.AppGwWAF.PreventionMode.md) | Use protection mode in Application Gateway Web Application Firewall (WAF) policies to protect back end resources. | Critical
[Azure.AppGwWAF.RuleGroups](../rules/Azure.AppGwWAF.RuleGroups.md) | Use recommended rule groups in Application Gateway Web Application Firewall (WAF) policies to protect back end resources. | Critical
[Azure.AppInsights.Name](../rules/Azure.AppInsights.Name.md) | Azure Resource Manager (ARM) has requirements for Application Insights resource names. | Awareness
[Azure.AppInsights.Workspace](../rules/Azure.AppInsights.Workspace.md) | Configure Application Insights resources to store data in a workspace. | Important
[Azure.AppService.AlwaysOn](../rules/Azure.AppService.AlwaysOn.md) | Configure Always On for App Service apps. | Important
[Azure.AppService.ARRAffinity](../rules/Azure.AppService.ARRAffinity.md) | Disable client affinity for stateless services. | Awareness
[Azure.AppService.HTTP2](../rules/Azure.AppService.HTTP2.md) | Use HTTP/2 instead of HTTP/1.x to improve protocol efficiency. | Awareness
[Azure.AppService.ManagedIdentity](../rules/Azure.AppService.ManagedIdentity.md) | Configure managed identities to access Azure resources. | Important
[Azure.AppService.MinPlan](../rules/Azure.AppService.MinPlan.md) | Use at least a Standard App Service Plan. | Important
[Azure.AppService.MinTLS](../rules/Azure.AppService.MinTLS.md) | App Service should not accept weak or deprecated transport protocols for client-server communication. | Critical
[Azure.AppService.NETVersion](../rules/Azure.AppService.NETVersion.md) | Configure applications to use newer .NET versions. | Important
[Azure.AppService.PHPVersion](../rules/Azure.AppService.PHPVersion.md) | Configure applications to use newer PHP runtime versions. | Important
[Azure.AppService.PlanInstanceCount](../rules/Azure.AppService.PlanInstanceCount.md) | App Service Plan should use a minimum number of instances for failover. | Important
[Azure.AppService.RemoteDebug](../rules/Azure.AppService.RemoteDebug.md) | Disable remote debugging on App Service apps when not in use. | Important
[Azure.AppService.UseHTTPS](../rules/Azure.AppService.UseHTTPS.md) | Unencrypted communication could allow disclosure of information to an untrusted party. | Important
[Azure.AppService.WebProbe](../rules/Azure.AppService.WebProbe.md) | Configure and enable instance health probes. | Important
[Azure.AppService.WebProbePath](../rules/Azure.AppService.WebProbePath.md) | Configure a dedicated path for health probe requests. | Important
[Azure.AppService.WebSecureFtp](../rules/Azure.AppService.WebSecureFtp.md) | Web apps should disable insecure FTP and configure SFTP when required. | Important
[Azure.ASE.MigrateV3](../rules/Azure.ASE.MigrateV3.md) | Use ASEv3 as replacement for the classic app service environment versions ASEv1 and ASEv2. | Important
[Azure.ASG.Name](../rules/Azure.ASG.Name.md) | Application Security Group (ASG) names should meet naming requirements. | Awareness
[Azure.Automation.AuditLogs](../rules/Azure.Automation.AuditLogs.md) | Ensure automation account audit diagnostic logs are enabled. | Important
[Azure.Automation.EncryptVariables](../rules/Azure.Automation.EncryptVariables.md) | Azure Automation variables should be encrypted. | Important
[Azure.Automation.ManagedIdentity](../rules/Azure.Automation.ManagedIdentity.md) | Ensure Managed Identity is used for authentication. | Important
[Azure.Automation.PlatformLogs](../rules/Azure.Automation.PlatformLogs.md) | Ensure automation account platform diagnostic logs are enabled. | Important
[Azure.Automation.WebHookExpiry](../rules/Azure.Automation.WebHookExpiry.md) | Do not create webhooks with an expiry time greater than 1 year (default). | Awareness
[Azure.Bastion.Name](../rules/Azure.Bastion.Name.md) | Bastion hosts should meet naming requirements. | Awareness
[Azure.BV.Immutable](../rules/Azure.BV.Immutable.md) | Ensure immutability is configured to protect backup data. | Important
[Azure.CDN.EndpointName](../rules/Azure.CDN.EndpointName.md) | Azure CDN Endpoint names should meet naming requirements. | Awareness
[Azure.CDN.HTTP](../rules/Azure.CDN.HTTP.md) | Unencrypted communication could allow disclosure of information to an untrusted party. | Important
[Azure.CDN.MinTLS](../rules/Azure.CDN.MinTLS.md) | Azure CDN endpoints should reject TLS versions older than 1.2. | Important
[Azure.CDN.UseFrontDoor](../rules/Azure.CDN.UseFrontDoor.md) | Use Azure Front Door Standard or Premium SKU to improve the performance of web pages with dynamic content and overall capabilities. | Important
[Azure.ContainerApp.APIVersion](../rules/Azure.ContainerApp.APIVersion.md) | Migrate from retired API version to a supported version. | Important
[Azure.ContainerApp.DisableAffinity](../rules/Azure.ContainerApp.DisableAffinity.md) | Disable session affinity to prevent unbalanced distribution. | Awareness
[Azure.ContainerApp.ExternalIngress](../rules/Azure.ContainerApp.ExternalIngress.md) | Limit inbound communication for Container Apps is limited to callers within the Container Apps Environment. | Important
[Azure.ContainerApp.Insecure](../rules/Azure.ContainerApp.Insecure.md) | Ensure insecure inbound traffic is not permitted to the container app. | Important
[Azure.ContainerApp.ManagedIdentity](../rules/Azure.ContainerApp.ManagedIdentity.md) | Ensure managed identity is used for authentication. | Important
[Azure.ContainerApp.Name](../rules/Azure.ContainerApp.Name.md) | Container Apps should meet naming requirements. | Awareness
[Azure.ContainerApp.PublicAccess](../rules/Azure.ContainerApp.PublicAccess.md) | Ensure public network access for Container Apps environment is disabled. | Important
[Azure.ContainerApp.RestrictIngress](../rules/Azure.ContainerApp.RestrictIngress.md) | IP ingress restrictions mode should be set to allow action for all rules defined. | Important
[Azure.ContainerApp.Storage](../rules/Azure.ContainerApp.Storage.md) | Use of Azure Files volume mounts to persistent storage container data. | Awareness
[Azure.Cosmos.AccountName](../rules/Azure.Cosmos.AccountName.md) | Cosmos DB account names should meet naming requirements. | Awareness
[Azure.Cosmos.DefenderCloud](../rules/Azure.Cosmos.DefenderCloud.md) | Enable Microsoft Defender for Azure Cosmos DB. | Critical
[Azure.Cosmos.DisableMetadataWrite](../rules/Azure.Cosmos.DisableMetadataWrite.md) | Use Entra ID identities for management place operations in Azure Cosmos DB. | Important
[Azure.Databricks.PublicAccess](../rules/Azure.Databricks.PublicAccess.md) | Azure Databricks workspaces should disable public network access. | Critical
[Azure.Databricks.SecureConnectivity](../rules/Azure.Databricks.SecureConnectivity.md) | Use Databricks workspaces configured for secure cluster connectivity. | Critical
[Azure.Databricks.SKU](../rules/Azure.Databricks.SKU.md) | Ensure Databricks workspaces are non-trial SKUs for production workloads. | Critical
[Azure.DataFactory.Version](../rules/Azure.DataFactory.Version.md) | Consider migrating to DataFactory v2. | Awareness
[Azure.Defender.Api](../rules/Azure.Defender.Api.md) | Enable Microsoft Defender for APIs. | Critical
[Azure.Defender.AppServices](../rules/Azure.Defender.AppServices.md) | Enable Microsoft Defender for App Service. | Critical
[Azure.Defender.Arm](../rules/Azure.Defender.Arm.md) | Enable Microsoft Defender for Azure Resource Manager (ARM). | Critical
[Azure.Defender.Containers](../rules/Azure.Defender.Containers.md) | Enable Microsoft Defender for Containers. | Critical
[Azure.Defender.CosmosDb](../rules/Azure.Defender.CosmosDb.md) | Enable Microsoft Defender for Azure Cosmos DB. | Critical
[Azure.Defender.Cspm](../rules/Azure.Defender.Cspm.md) | Enable Microsoft Defender Cloud Security Posture Management Standard plan. | Critical
[Azure.Defender.Dns](../rules/Azure.Defender.Dns.md) | Enable Microsoft Defender for DNS. | Critical
[Azure.Defender.KeyVault](../rules/Azure.Defender.KeyVault.md) | Enable Microsoft Defender for Key Vault. | Critical
[Azure.Defender.OssRdb](../rules/Azure.Defender.OssRdb.md) | Enable Microsoft Defender for open-source relational databases. | Critical
[Azure.Defender.Servers](../rules/Azure.Defender.Servers.md) | Enable Microsoft Defender for Servers. | Critical
[Azure.Defender.SQL](../rules/Azure.Defender.SQL.md) | Enable Microsoft Defender for SQL servers. | Critical
[Azure.Defender.SQLOnVM](../rules/Azure.Defender.SQLOnVM.md) | Enable Microsoft Defender for SQL servers on machines. | Critical
[Azure.Defender.Storage](../rules/Azure.Defender.Storage.md) | Enable Microsoft Defender for Storage. | Critical
[Azure.Defender.Storage.MalwareScan](../rules/Azure.Defender.Storage.MalwareScan.md) | Enable Malware Scanning in Microsoft Defender for Storage. | Critical
[Azure.DefenderCloud.Provisioning](../rules/Azure.DefenderCloud.Provisioning.md) | Enable auto-provisioning on to improve Microsoft Defender for Cloud insights. | Important
[Azure.Deployment.AdminUsername](../rules/Azure.Deployment.AdminUsername.md) | A sensitive property set from deterministic or hardcoded values is not secure. | Awareness
[Azure.Deployment.Name](../rules/Azure.Deployment.Name.md) | Nested deployments should meet naming requirements of deployments. | Awareness
[Azure.Deployment.OuterSecret](../rules/Azure.Deployment.OuterSecret.md) | Outer evaluation deployments may leak secrets exposed as secure parameters into logs and nested deployments. | Critical
[Azure.Deployment.OutputSecretValue](../rules/Azure.Deployment.OutputSecretValue.md) | Outputting a sensitive value from deployment may leak secrets into deployment history or logs. | Critical
[Azure.Deployment.SecureParameter](../rules/Azure.Deployment.SecureParameter.md) | Sensitive parameters that have been not been marked as secure may leak the secret into deployment history or logs. | Critical
[Azure.DevBox.ProjectLimit](../rules/Azure.DevBox.ProjectLimit.md) | Limit the number of Dev Boxes a single user can create for a project. | Important
[Azure.EventGrid.DisableLocalAuth](../rules/Azure.EventGrid.DisableLocalAuth.md) | Authenticate publishing clients with Azure AD identities. | Important
[Azure.EventGrid.ManagedIdentity](../rules/Azure.EventGrid.ManagedIdentity.md) | Use managed identities to deliver Event Grid Topic events. | Important
[Azure.EventGrid.TopicPublicAccess](../rules/Azure.EventGrid.TopicPublicAccess.md) | Use Private Endpoints to access Event Grid topics and domains. | Important
[Azure.EventHub.DisableLocalAuth](../rules/Azure.EventHub.DisableLocalAuth.md) | Authenticate Event Hub publishers and consumers with Entra ID identities. | Important
[Azure.EventHub.MinTLS](../rules/Azure.EventHub.MinTLS.md) | Weak or deprecated transport protocols for client-server communication introduce security vulnerabilities. | Critical
[Azure.EventHub.Usage](../rules/Azure.EventHub.Usage.md) | Regularly remove unused resources to reduce costs. | Important
[Azure.Firewall.Mode](../rules/Azure.Firewall.Mode.md) | Deny high confidence malicious IP addresses and domains on classic managed Azure Firewalls. | Critical
[Azure.Firewall.Name](../rules/Azure.Firewall.Name.md) | Firewall names should meet naming requirements. | Awareness
[Azure.Firewall.PolicyMode](../rules/Azure.Firewall.PolicyMode.md) | Deny high confidence malicious IP addresses, domains and URLs. | Critical
[Azure.Firewall.PolicyName](../rules/Azure.Firewall.PolicyName.md) | Firewall policy names should meet naming requirements. | Awareness
[Azure.FrontDoor.Logs](../rules/Azure.FrontDoor.Logs.md) | Audit and monitor access through Azure Front Door profiles. | Important
[Azure.FrontDoor.ManagedIdentity](../rules/Azure.FrontDoor.ManagedIdentity.md) | Ensure Front Door uses a managed identity to authorize access to Azure resources. | Important
[Azure.FrontDoor.MinTLS](../rules/Azure.FrontDoor.MinTLS.md) | Front Door Classic instances should reject TLS versions older than 1.2. | Critical
[Azure.FrontDoor.Name](../rules/Azure.FrontDoor.Name.md) | Front Door names should meet naming requirements. | Awareness
[Azure.FrontDoor.Probe](../rules/Azure.FrontDoor.Probe.md) | Use health probes to check the health of each backend. | Important
[Azure.FrontDoor.ProbeMethod](../rules/Azure.FrontDoor.ProbeMethod.md) | Configure health probes to use HEAD requests to reduce performance overhead. | Important
[Azure.FrontDoor.ProbePath](../rules/Azure.FrontDoor.ProbePath.md) | Configure a dedicated path for health probe requests. | Important
[Azure.FrontDoor.State](../rules/Azure.FrontDoor.State.md) | Enable Azure Front Door Classic instance. | Important
[Azure.FrontDoor.UseCaching](../rules/Azure.FrontDoor.UseCaching.md) | Use caching to reduce retrieving contents from origins. | Important
[Azure.FrontDoor.UseWAF](../rules/Azure.FrontDoor.UseWAF.md) | Enable Web Application Firewall (WAF) policies on each Front Door endpoint. | Critical
[Azure.FrontDoor.WAF.Enabled](../rules/Azure.FrontDoor.WAF.Enabled.md) | Front Door Web Application Firewall (WAF) policy must be enabled to protect back end resources. | Critical
[Azure.FrontDoor.WAF.Mode](../rules/Azure.FrontDoor.WAF.Mode.md) | Use protection mode in Front Door Web Application Firewall (WAF) policies to protect back end resources. | Critical
[Azure.FrontDoor.WAF.Name](../rules/Azure.FrontDoor.WAF.Name.md) | Front Door WAF policy names should meet naming requirements. | Awareness
[Azure.FrontDoorWAF.Enabled](../rules/Azure.FrontDoorWAF.Enabled.md) | Front Door Web Application Firewall (WAF) policy must be enabled to protect back end resources. | Critical
[Azure.FrontDoorWAF.Exclusions](../rules/Azure.FrontDoorWAF.Exclusions.md) | Use recommended rule groups in Front Door Web Application Firewall (WAF) policies to protect back end resources. Avoid configuring rule exclusions. | Critical
[Azure.FrontDoorWAF.PreventionMode](../rules/Azure.FrontDoorWAF.PreventionMode.md) | Use protection mode in Front Door Web Application Firewall (WAF) policies to protect back end resources. | Critical
[Azure.FrontDoorWAF.RuleGroups](../rules/Azure.FrontDoorWAF.RuleGroups.md) | Use recommended rule groups in Front Door Web Application Firewall (WAF) policies to protect back end resources. | Critical
[Azure.Group.Name](../rules/Azure.Group.Name.md) | Azure Resource Manager (ARM) has requirements for Resource Groups names. | Awareness
[Azure.Identity.UserAssignedName](../rules/Azure.Identity.UserAssignedName.md) | Managed Identity names should meet naming requirements. | Awareness
[Azure.IoTHub.MinTLS](../rules/Azure.IoTHub.MinTLS.md) | IoT Hubs should reject TLS versions older than 1.2. | Critical
[Azure.KeyVault.AccessPolicy](../rules/Azure.KeyVault.AccessPolicy.md) | Use the principal of least privilege when assigning access to Key Vault. | Important
[Azure.KeyVault.AutoRotationPolicy](../rules/Azure.KeyVault.AutoRotationPolicy.md) | Keys that become compromised may be used to spoof, decrypt, or gain access to sensitive data. | Important
[Azure.KeyVault.Firewall](../rules/Azure.KeyVault.Firewall.md) | Key Vault should only accept explicitly allowed traffic. | Important
[Azure.KeyVault.KeyName](../rules/Azure.KeyVault.KeyName.md) | Key Vault Key names should meet naming requirements. | Awareness
[Azure.KeyVault.Logs](../rules/Azure.KeyVault.Logs.md) | Ensure audit diagnostics logs are enabled to audit Key Vault access. | Important
[Azure.KeyVault.Name](../rules/Azure.KeyVault.Name.md) | Key Vault names should meet naming requirements. | Awareness
[Azure.KeyVault.PurgeProtect](../rules/Azure.KeyVault.PurgeProtect.md) | Enable Purge Protection on Key Vaults to prevent early purge of vaults and vault items. | Important
[Azure.KeyVault.RBAC](../rules/Azure.KeyVault.RBAC.md) | Key Vaults should use Azure RBAC as the authorization system for the data plane. | Awareness
[Azure.KeyVault.SecretName](../rules/Azure.KeyVault.SecretName.md) | Key Vault Secret names should meet naming requirements. | Awareness
[Azure.KeyVault.SoftDelete](../rules/Azure.KeyVault.SoftDelete.md) | Enable Soft Delete on Key Vaults to protect vaults and vault items from accidental deletion. | Important
[Azure.LB.AvailabilityZone](../rules/Azure.LB.AvailabilityZone.md) | Load balancers deployed with Standard SKU should be zone-redundant for high availability. | Important
[Azure.LB.Name](../rules/Azure.LB.Name.md) | Load Balancer names should meet naming requirements. | Awareness
[Azure.LB.Probe](../rules/Azure.LB.Probe.md) | Use a specific probe for web protocols. | Important
[Azure.LB.StandardSKU](../rules/Azure.LB.StandardSKU.md) | Load balancers should be deployed with Standard SKU for production workloads. | Important
[Azure.LogicApp.LimitHTTPTrigger](../rules/Azure.LogicApp.LimitHTTPTrigger.md) | Logic Apps using HTTP triggers without restrictions can be accessed from any network location including the Internet. | Critical
[Azure.MariaDB.AllowAzureAccess](../rules/Azure.MariaDB.AllowAzureAccess.md) | Determine if access from Azure services is required. | Important
[Azure.MariaDB.DatabaseName](../rules/Azure.MariaDB.DatabaseName.md) | Azure Database for MariaDB databases should meet naming requirements. | Awareness
[Azure.MariaDB.DefenderCloud](../rules/Azure.MariaDB.DefenderCloud.md) | Enable Microsoft Defender for Cloud for Azure Database for MariaDB. | Important
[Azure.MariaDB.FirewallIPRange](../rules/Azure.MariaDB.FirewallIPRange.md) | Determine if there is an excessive number of permitted IP addresses. | Important
[Azure.MariaDB.FirewallRuleCount](../rules/Azure.MariaDB.FirewallRuleCount.md) | Determine if there is an excessive number of firewall rules. | Awareness
[Azure.MariaDB.FirewallRuleName](../rules/Azure.MariaDB.FirewallRuleName.md) | Azure Database for MariaDB firewall rules should meet naming requirements. | Awareness
[Azure.MariaDB.GeoRedundantBackup](../rules/Azure.MariaDB.GeoRedundantBackup.md) | Azure Database for MariaDB should store backups in a geo-redundant storage. | Important
[Azure.MariaDB.MinTLS](../rules/Azure.MariaDB.MinTLS.md) | Azure Database for MariaDB servers should reject TLS versions older than 1.2. | Critical
[Azure.MariaDB.ServerName](../rules/Azure.MariaDB.ServerName.md) | Azure Database for MariaDB servers should meet naming requirements. | Awareness
[Azure.MariaDB.UseSSL](../rules/Azure.MariaDB.UseSSL.md) | Azure Database for MariaDB servers should only accept encrypted connections. | Critical
[Azure.MariaDB.VNETRuleName](../rules/Azure.MariaDB.VNETRuleName.md) | Azure Database for MariaDB VNET rules should meet naming requirements. | Awareness
[Azure.ML.ComputeIdleShutdown](../rules/Azure.ML.ComputeIdleShutdown.md) | Configure an idle shutdown timeout for Machine Learning compute instances. | Critical
[Azure.ML.ComputeVnet](../rules/Azure.ML.ComputeVnet.md) | Azure Machine Learning Computes should be hosted in a virtual network (VNet). | Critical
[Azure.ML.DisableLocalAuth](../rules/Azure.ML.DisableLocalAuth.md) | Azure Machine Learning compute resources should have local authentication methods disabled. | Critical
[Azure.ML.PublicAccess](../rules/Azure.ML.PublicAccess.md) | Disable public network access from a Azure Machine Learning workspace. | Critical
[Azure.ML.UserManagedIdentity](../rules/Azure.ML.UserManagedIdentity.md) | ML workspaces should use user-assigned managed identity, rather than the default system-assigned managed identity. | Important
[Azure.Monitor.ServiceHealth](../rules/Azure.Monitor.ServiceHealth.md) | Configure Service Health alerts to notify administrators. | Important
[Azure.MySQL.AAD](../rules/Azure.MySQL.AAD.md) | Use Entra ID authentication with Azure Database for MySQL databases. | Critical
[Azure.MySQL.AADOnly](../rules/Azure.MySQL.AADOnly.md) | Ensure Entra ID only authentication is enabled with Azure Database for MySQL databases. | Important
[Azure.MySQL.AllowAzureAccess](../rules/Azure.MySQL.AllowAzureAccess.md) | Determine if access from Azure services is required. | Important
[Azure.MySQL.DefenderCloud](../rules/Azure.MySQL.DefenderCloud.md) | Enable Microsoft Defender for Cloud for Azure Database for MySQL. | Important
[Azure.MySQL.FirewallIPRange](../rules/Azure.MySQL.FirewallIPRange.md) | Determine if there is an excessive number of permitted IP addresses. | Important
[Azure.MySQL.FirewallRuleCount](../rules/Azure.MySQL.FirewallRuleCount.md) | Determine if there is an excessive number of firewall rules. | Awareness
[Azure.MySQL.GeoRedundantBackup](../rules/Azure.MySQL.GeoRedundantBackup.md) | Azure Database for MySQL should store backups in a geo-redundant storage. | Important
[Azure.MySQL.MinTLS](../rules/Azure.MySQL.MinTLS.md) | MySQL DB servers should reject TLS versions older than 1.2. | Critical
[Azure.MySQL.ServerName](../rules/Azure.MySQL.ServerName.md) | Azure MySQL DB server names should meet naming requirements. | Awareness
[Azure.MySQL.UseFlexible](../rules/Azure.MySQL.UseFlexible.md) | Use Azure Database for MySQL Flexible Server deployment model. | Important
[Azure.MySQL.UseSSL](../rules/Azure.MySQL.UseSSL.md) | Enforce encrypted MySQL connections. | Critical
[Azure.NIC.Attached](../rules/Azure.NIC.Attached.md) | Network interfaces (NICs) that are not used should be removed. | Awareness
[Azure.NIC.Name](../rules/Azure.NIC.Name.md) | Network Interface (NIC) names should meet naming requirements. | Awareness
[Azure.NIC.UniqueDns](../rules/Azure.NIC.UniqueDns.md) | Network interfaces (NICs) should inherit DNS from virtual networks. | Awareness
[Azure.NSG.AKSRules](../rules/Azure.NSG.AKSRules.md) | AKS Network Security Group (NSG) should not have custom rules. | Awareness
[Azure.NSG.AnyInboundSource](../rules/Azure.NSG.AnyInboundSource.md) | Network security groups (NSGs) should avoid rules that allow "any" as an inbound source. | Critical
[Azure.NSG.Associated](../rules/Azure.NSG.Associated.md) | Network Security Groups (NSGs) should be associated to a subnet or network interface. | Awareness
[Azure.NSG.DenyAllInbound](../rules/Azure.NSG.DenyAllInbound.md) | When all inbound traffic is denied, some functions that affect the reliability of your service may not work as expected. | Important
[Azure.NSG.LateralTraversal](../rules/Azure.NSG.LateralTraversal.md) | Deny outbound management connections from non-management hosts. | Important
[Azure.NSG.Name](../rules/Azure.NSG.Name.md) | Azure Resource Manager (ARM) has requirements for Network Security Group (NSG) names. | Awareness
[Azure.Policy.AssignmentAssignedBy](../rules/Azure.Policy.AssignmentAssignedBy.md) | Policy assignments should use assignedBy metadata. | Awareness
[Azure.Policy.AssignmentDescriptors](../rules/Azure.Policy.AssignmentDescriptors.md) | Policy assignments should use a display name and description. | Awareness
[Azure.Policy.Descriptors](../rules/Azure.Policy.Descriptors.md) | Policy and initiative definitions should use a display name, description, and category. | Awareness
[Azure.Policy.ExemptionDescriptors](../rules/Azure.Policy.ExemptionDescriptors.md) | Policy exemptions should use a display name and description. | Awareness
[Azure.Policy.WaiverExpiry](../rules/Azure.Policy.WaiverExpiry.md) | Configure policy waiver exemptions to expire. | Awareness
[Azure.PostgreSQL.AAD](../rules/Azure.PostgreSQL.AAD.md) | Use Entra ID authentication with Azure Database for PostgreSQL databases. | Critical
[Azure.PostgreSQL.AADOnly](../rules/Azure.PostgreSQL.AADOnly.md) | Ensure Entra ID only authentication is enabled with Azure Database for PostgreSQL databases. | Important
[Azure.PostgreSQL.AllowAzureAccess](../rules/Azure.PostgreSQL.AllowAzureAccess.md) | Determine if access from Azure services is required. | Important
[Azure.PostgreSQL.DefenderCloud](../rules/Azure.PostgreSQL.DefenderCloud.md) | Enable Microsoft Defender for Cloud for Azure Database for PostgreSQL. | Important
[Azure.PostgreSQL.FirewallIPRange](../rules/Azure.PostgreSQL.FirewallIPRange.md) | Determine if there is an excessive number of permitted IP addresses. | Important
[Azure.PostgreSQL.FirewallRuleCount](../rules/Azure.PostgreSQL.FirewallRuleCount.md) | Determine if there is an excessive number of firewall rules. | Awareness
[Azure.PostgreSQL.GeoRedundantBackup](../rules/Azure.PostgreSQL.GeoRedundantBackup.md) | Azure Database for PostgreSQL should store backups in a geo-redundant storage. | Important
[Azure.PostgreSQL.MinTLS](../rules/Azure.PostgreSQL.MinTLS.md) | PostgreSQL DB servers should reject TLS versions older than 1.2. | Critical
[Azure.PostgreSQL.ServerName](../rules/Azure.PostgreSQL.ServerName.md) | Azure PostgreSQL DB server names should meet naming requirements. | Awareness
[Azure.PostgreSQL.UseSSL](../rules/Azure.PostgreSQL.UseSSL.md) | Enforce encrypted PostgreSQL connections. | Critical
[Azure.PrivateEndpoint.Name](../rules/Azure.PrivateEndpoint.Name.md) | Private Endpoint names should meet naming requirements. | Awareness
[Azure.PublicIP.AvailabilityZone](../rules/Azure.PublicIP.AvailabilityZone.md) | Public IP addresses deployed with Standard SKU should use availability zones in supported regions for high availability. | Important
[Azure.PublicIP.DNSLabel](../rules/Azure.PublicIP.DNSLabel.md) | Public IP domain name labels should meet naming requirements. | Awareness
[Azure.PublicIP.IsAttached](../rules/Azure.PublicIP.IsAttached.md) | Public IP addresses should be attached or cleaned up if not in use. | Important
[Azure.PublicIP.MigrateStandard](../rules/Azure.PublicIP.MigrateStandard.md) | Use the Standard SKU for Public IP addresses as the Basic SKU will be retired. | Important
[Azure.PublicIP.Name](../rules/Azure.PublicIP.Name.md) | Azure Resource Manager (ARM) has requirements for Public IP address names. | Awareness
[Azure.PublicIP.StandardSKU](../rules/Azure.PublicIP.StandardSKU.md) | The basic SKU is being retired on 30 September 2025, and does not include several reliability and security features. | Important
[Azure.RBAC.CoAdministrator](../rules/Azure.RBAC.CoAdministrator.md) | Delegate access to manage Azure resources using role-based access control (RBAC). | Important
[Azure.RBAC.LimitMGDelegation](../rules/Azure.RBAC.LimitMGDelegation.md) | Limit Role-Base Access Control (RBAC) inheritance from Management Groups. | Important
[Azure.RBAC.LimitOwner](../rules/Azure.RBAC.LimitOwner.md) | Limit the number of subscription Owners. | Important
[Azure.RBAC.PIM](../rules/Azure.RBAC.PIM.md) | Use just-in-time (JiT) activation of roles instead of persistent role assignment. | Important
[Azure.RBAC.UseGroups](../rules/Azure.RBAC.UseGroups.md) | Use groups for assigning permissions instead of individual user accounts. | Important
[Azure.RBAC.UseRGDelegation](../rules/Azure.RBAC.UseRGDelegation.md) | Use RBAC assignments on resource groups instead of individual resources. | Important
[Azure.Redis.AvailabilityZone](../rules/Azure.Redis.AvailabilityZone.md) | Premium Redis cache should be deployed with availability zones for high availability. | Important
[Azure.Redis.FirewallIPRange](../rules/Azure.Redis.FirewallIPRange.md) | Determine if there is an excessive number of permitted IP addresses for the Redis cache. | Critical
[Azure.Redis.FirewallRuleCount](../rules/Azure.Redis.FirewallRuleCount.md) | Determine if there is an excessive number of firewall rules for the Redis cache. | Awareness
[Azure.Redis.MaxMemoryReserved](../rules/Azure.Redis.MaxMemoryReserved.md) | Configure maxmemory-reserved to reserve memory for non-cache operations. | Important
[Azure.Redis.MinSKU](../rules/Azure.Redis.MinSKU.md) | Use Azure Cache for Redis instances of at least Standard C1. | Important
[Azure.Redis.MinTLS](../rules/Azure.Redis.MinTLS.md) | Redis Cache should reject TLS versions older than 1.2. | Critical
[Azure.Redis.NonSslPort](../rules/Azure.Redis.NonSslPort.md) | Azure Cache for Redis should only accept secure connections. | Critical
[Azure.Redis.PublicNetworkAccess](../rules/Azure.Redis.PublicNetworkAccess.md) | Redis cache should disable public network access. | Critical
[Azure.Redis.Version](../rules/Azure.Redis.Version.md) | Azure Cache for Redis should use the latest supported version of Redis. | Important
[Azure.RedisEnterprise.MinTLS](../rules/Azure.RedisEnterprise.MinTLS.md) | Redis Cache should reject TLS versions older than 1.2. | Critical
[Azure.RedisEnterprise.Zones](../rules/Azure.RedisEnterprise.Zones.md) | Enterprise Redis cache should be zone-redundant for high availability. | Important
[Azure.Resource.AllowedRegions](../rules/Azure.Resource.AllowedRegions.md) | The deployment location of a resource determines the country or region where metadata and data is stored and processed. | Important
[Azure.Resource.UseTags](../rules/Azure.Resource.UseTags.md) | Azure resources should be tagged using a standard convention. | Awareness
[Azure.Route.Name](../rules/Azure.Route.Name.md) | Azure Resource Manager (ARM) has requirements for Route table names. | Awareness
[Azure.RSV.Immutable](../rules/Azure.RSV.Immutable.md) | Ensure immutability is configured to protect backup data. | Important
[Azure.RSV.Name](../rules/Azure.RSV.Name.md) | Recovery Services vaults should meet naming requirements. | Awareness
[Azure.RSV.ReplicationAlert](../rules/Azure.RSV.ReplicationAlert.md) | Recovery Services Vaults (RSV) without replication alerts configured may be at risk. | Important
[Azure.RSV.StorageType](../rules/Azure.RSV.StorageType.md) | Recovery Services Vaults (RSV) not using geo-replicated storage (GRS) may be at risk. | Important
[Azure.Search.IndexSLA](../rules/Azure.Search.IndexSLA.md) | Use a minimum of 3 replicas to receive an SLA for query and index updates. | Important
[Azure.Search.ManagedIdentity](../rules/Azure.Search.ManagedIdentity.md) | Configure managed identities to access Azure resources. | Important
[Azure.Search.Name](../rules/Azure.Search.Name.md) | Azure Resource Manager (ARM) has requirements for AI Search service names. | Awareness
[Azure.Search.QuerySLA](../rules/Azure.Search.QuerySLA.md) | Use a minimum of 2 replicas to receive an SLA for index queries. | Important
[Azure.Search.SKU](../rules/Azure.Search.SKU.md) | Use the basic and standard tiers for entry level workloads. | Critical
[Azure.ServiceBus.AuditLogs](../rules/Azure.ServiceBus.AuditLogs.md) | Ensure namespaces audit diagnostic logs are enabled. | Important
[Azure.ServiceBus.DisableLocalAuth](../rules/Azure.ServiceBus.DisableLocalAuth.md) | Authenticate Service Bus publishers and consumers with Entra ID identities. | Important
[Azure.ServiceBus.MinTLS](../rules/Azure.ServiceBus.MinTLS.md) | Service Bus namespaces should reject TLS versions older than 1.2. | Important
[Azure.ServiceBus.Usage](../rules/Azure.ServiceBus.Usage.md) | Regularly remove unused resources to reduce costs. | Important
[Azure.ServiceFabric.AAD](../rules/Azure.ServiceFabric.AAD.md) | Use Entra ID client authentication for Service Fabric clusters. | Critical
[Azure.SignalR.ManagedIdentity](../rules/Azure.SignalR.ManagedIdentity.md) | Configure SignalR Services to use managed identities to access Azure resources securely. | Important
[Azure.SignalR.Name](../rules/Azure.SignalR.Name.md) | SignalR service instance names should meet naming requirements. | Awareness
[Azure.SignalR.SLA](../rules/Azure.SignalR.SLA.md) | Use SKUs that include an SLA when configuring SignalR Services. | Important
[Azure.SQL.AAD](../rules/Azure.SQL.AAD.md) | Use Entra ID authentication with Azure SQL databases. | Critical
[Azure.SQL.AADOnly](../rules/Azure.SQL.AADOnly.md) | Ensure Entra ID only authentication is enabled with Azure SQL Database. | Important
[Azure.SQL.AllowAzureAccess](../rules/Azure.SQL.AllowAzureAccess.md) | Determine if access from Azure services is required. | Important
[Azure.SQL.Auditing](../rules/Azure.SQL.Auditing.md) | Enable auditing for Azure SQL logical server. | Important
[Azure.SQL.DBName](../rules/Azure.SQL.DBName.md) | Azure SQL Database names should meet naming requirements. | Awareness
[Azure.SQL.DefenderCloud](../rules/Azure.SQL.DefenderCloud.md) | Enable Microsoft Defender for Azure SQL logical server. | Important
[Azure.SQL.FGName](../rules/Azure.SQL.FGName.md) | Azure SQL failover group names should meet naming requirements. | Awareness
[Azure.SQL.FirewallIPRange](../rules/Azure.SQL.FirewallIPRange.md) | Each IP address in the permitted IP list is allowed network access to any databases hosted on the same logical server. | Important
[Azure.SQL.FirewallRuleCount](../rules/Azure.SQL.FirewallRuleCount.md) | Determine if there is an excessive number of firewall rules. | Awareness
[Azure.SQL.MinTLS](../rules/Azure.SQL.MinTLS.md) | Azure SQL Database servers should reject TLS versions older than 1.2. | Critical
[Azure.SQL.ServerName](../rules/Azure.SQL.ServerName.md) | Azure SQL logical server names should meet naming requirements. | Awareness
[Azure.SQL.TDE](../rules/Azure.SQL.TDE.md) | Use Transparent Data Encryption (TDE) with Azure SQL Database. | Critical
[Azure.SQLMI.AAD](../rules/Azure.SQLMI.AAD.md) | Use Azure Active Directory (AAD) authentication with Azure SQL Managed Instance. | Critical
[Azure.SQLMI.AADOnly](../rules/Azure.SQLMI.AADOnly.md) | Ensure Azure AD-only authentication is enabled with Azure SQL Managed Instance. | Important
[Azure.SQLMI.ManagedIdentity](../rules/Azure.SQLMI.ManagedIdentity.md) | Ensure managed identity is used to allow support for Azure AD authentication. | Important
[Azure.SQLMI.Name](../rules/Azure.SQLMI.Name.md) | SQL Managed Instance names should meet naming requirements. | Awareness
[Azure.Storage.BlobAccessType](../rules/Azure.Storage.BlobAccessType.md) | Use containers configured with a private access type that requires authorization. | Important
[Azure.Storage.BlobPublicAccess](../rules/Azure.Storage.BlobPublicAccess.md) | Storage Accounts should only accept authorized requests. | Important
[Azure.Storage.ContainerSoftDelete](../rules/Azure.Storage.ContainerSoftDelete.md) | Enable container soft delete on Storage Accounts. | Important
[Azure.Storage.Defender.MalwareScan](../rules/Azure.Storage.Defender.MalwareScan.md) | Enable Malware Scanning in Microsoft Defender for Storage. | Critical
[Azure.Storage.DefenderCloud](../rules/Azure.Storage.DefenderCloud.md) | Enable Microsoft Defender for Storage for storage accounts. | Critical
[Azure.Storage.FileShareSoftDelete](../rules/Azure.Storage.FileShareSoftDelete.md) | Enable soft delete on Storage Accounts file shares. | Important
[Azure.Storage.Firewall](../rules/Azure.Storage.Firewall.md) | Storage Accounts should only accept explicitly allowed traffic. | Important
[Azure.Storage.MinTLS](../rules/Azure.Storage.MinTLS.md) | Storage Accounts should not accept weak or deprecated transport protocols for client-server communication. | Critical
[Azure.Storage.Name](../rules/Azure.Storage.Name.md) | Azure Resource Manager (ARM) has requirements for Storage Account names. | Awareness
[Azure.Storage.SecureTransfer](../rules/Azure.Storage.SecureTransfer.md) | Storage accounts should only accept encrypted connections. | Important
[Azure.Storage.SoftDelete](../rules/Azure.Storage.SoftDelete.md) | Enable blob soft delete on Storage Accounts. | Important
[Azure.Storage.UseReplication](../rules/Azure.Storage.UseReplication.md) | Storage Accounts using the LRS SKU are only replicated within a single zone. | Important
[Azure.Template.DebugDeployment](../rules/Azure.Template.DebugDeployment.md) | Use default deployment detail level for nested deployments. | Awareness
[Azure.Template.ExpressionLength](../rules/Azure.Template.ExpressionLength.md) | Template expressions should not exceed the maximum length. | Awareness
[Azure.Template.LocationDefault](../rules/Azure.Template.LocationDefault.md) | Set the default value for the location parameter within an ARM template to resource group location. | Awareness
[Azure.Template.LocationType](../rules/Azure.Template.LocationType.md) | Location parameters should use a string value. | Important
[Azure.Template.MetadataLink](../rules/Azure.Template.MetadataLink.md) | Configure a metadata link for each parameter file. | Important
[Azure.Template.ParameterDataTypes](../rules/Azure.Template.ParameterDataTypes.md) | Set the parameter default value to a value of the same type. | Important
[Azure.Template.ParameterFile](../rules/Azure.Template.ParameterFile.md) | Use ARM template parameter files that are valid. | Important
[Azure.Template.ParameterMetadata](../rules/Azure.Template.ParameterMetadata.md) | Set metadata descriptions in Azure Resource Manager (ARM) template for each parameter. | Awareness
[Azure.Template.ParameterMinMaxValue](../rules/Azure.Template.ParameterMinMaxValue.md) | Template parameters minValue and maxValue constraints must be valid. | Important
[Azure.Template.ParameterScheme](../rules/Azure.Template.ParameterScheme.md) | Use an Azure template parameter file schema with the https scheme. | Awareness
[Azure.Template.ParameterStrongType](../rules/Azure.Template.ParameterStrongType.md) | Set the parameter value to a value that matches the specified strong type. | Awareness
[Azure.Template.ParameterValue](../rules/Azure.Template.ParameterValue.md) | Specify a value for each parameter in template parameter files. | Awareness
[Azure.Template.ResourceLocation](../rules/Azure.Template.ResourceLocation.md) | Resource locations should be an expression or global. | Awareness
[Azure.Template.Resources](../rules/Azure.Template.Resources.md) | Each Azure Resource Manager (ARM) template file should deploy at least one resource. | Awareness
[Azure.Template.TemplateFile](../rules/Azure.Template.TemplateFile.md) | Use ARM template files that are valid. | Important
[Azure.Template.TemplateSchema](../rules/Azure.Template.TemplateSchema.md) | Use a more recent version of the Azure template schema. | Awareness
[Azure.Template.TemplateScheme](../rules/Azure.Template.TemplateScheme.md) | Use an Azure template file schema with the https scheme. | Awareness
[Azure.Template.UseComments](../rules/Azure.Template.UseComments.md) | Use comments for each resource in ARM template to communicate purpose. | Awareness
[Azure.Template.UseDescriptions](../rules/Azure.Template.UseDescriptions.md) | Use descriptions for each resource in generated template(bicep, psarm, AzOps) to communicate purpose. | Awareness
[Azure.Template.UseLocationParameter](../rules/Azure.Template.UseLocationParameter.md) | Template should reference a location parameter to specify resource location. | Awareness
[Azure.TrafficManager.Endpoints](../rules/Azure.TrafficManager.Endpoints.md) | Traffic Manager should use at lest two enabled endpoints. | Important
[Azure.TrafficManager.Protocol](../rules/Azure.TrafficManager.Protocol.md) | Monitor Traffic Manager web-based endpoints with HTTPS. | Important
[Azure.VM.AcceleratedNetworking](../rules/Azure.VM.AcceleratedNetworking.md) | Use accelerated networking for supported operating systems and VM types. | Important
[Azure.VM.ADE](../rules/Azure.VM.ADE.md) | Use Azure Disk Encryption (ADE). | Important
[Azure.VM.Agent](../rules/Azure.VM.Agent.md) | Virtual Machines (VMs) without an agent provisioned are unable to use monitoring, management, and security extensions. | Important
[Azure.VM.AMA](../rules/Azure.VM.AMA.md) | Use Azure Monitor Agent for collecting monitoring data from VMs. | Important
[Azure.VM.ASAlignment](../rules/Azure.VM.ASAlignment.md) | Use availability sets aligned with managed disks fault domains. | Important
[Azure.VM.ASMinMembers](../rules/Azure.VM.ASMinMembers.md) | Availability sets should be deployed with at least two virtual machines (VMs). | Important
[Azure.VM.ASName](../rules/Azure.VM.ASName.md) | Availability Set names should meet naming requirements. | Awareness
[Azure.VM.BasicSku](../rules/Azure.VM.BasicSku.md) | Virtual machines (VMs) should not use Basic sizes. | Important
[Azure.VM.ComputerName](../rules/Azure.VM.ComputerName.md) | Virtual Machine (VM) computer name should meet naming requirements. | Awareness
[Azure.VM.DiskAttached](../rules/Azure.VM.DiskAttached.md) | Managed disks should be attached to virtual machines or removed. | Important
[Azure.VM.DiskCaching](../rules/Azure.VM.DiskCaching.md) | Check disk caching is configured correctly for the workload. | Important
[Azure.VM.DiskName](../rules/Azure.VM.DiskName.md) | Managed Disk names should meet naming requirements. | Awareness
[Azure.VM.DiskSizeAlignment](../rules/Azure.VM.DiskSizeAlignment.md) | Align to the Managed Disk billing increments to improve cost efficiency. | Awareness
[Azure.VM.MigrateAMA](../rules/Azure.VM.MigrateAMA.md) | Use Azure Monitor Agent as replacement for Log Analytics Agent. | Important
[Azure.VM.Name](../rules/Azure.VM.Name.md) | Virtual Machine (VM) names should meet naming requirements. | Awareness
[Azure.VM.PPGName](../rules/Azure.VM.PPGName.md) | Proximity Placement Group (PPG) names should meet naming requirements. | Awareness
[Azure.VM.PromoSku](../rules/Azure.VM.PromoSku.md) | Virtual machines (VMs) should not use expired promotional SKU. | Awareness
[Azure.VM.PublicKey](../rules/Azure.VM.PublicKey.md) | Linux virtual machines should use public keys. | Important
[Azure.VM.ScriptExtensions](../rules/Azure.VM.ScriptExtensions.md) | Custom Script Extensions scripts that reference secret values must use the protectedSettings. | Important
[Azure.VM.ShouldNotBeStopped](../rules/Azure.VM.ShouldNotBeStopped.md) | Azure Virtual Machines in a stopped state are still allocated and billed for compute usage. | Important
[Azure.VM.SQLServerDisk](../rules/Azure.VM.SQLServerDisk.md) | Use Premium SSD disks or greater for data and log files for production SQL Server workloads. | Important
[Azure.VM.Standalone](../rules/Azure.VM.Standalone.md) | Single instance VMs are a single point of failure, however reliability can be improved by using premium storage. | Important
[Azure.VM.Updates](../rules/Azure.VM.Updates.md) | Ensure automatic updates are enabled at deployment. | Important
[Azure.VM.UseHybridUseBenefit](../rules/Azure.VM.UseHybridUseBenefit.md) | Use Azure Hybrid Benefit for applicable virtual machine (VM) workloads. | Awareness
[Azure.VM.UseManagedDisks](../rules/Azure.VM.UseManagedDisks.md) | Virtual machines (VMs) should use managed disks. | Important
[Azure.VMSS.AMA](../rules/Azure.VMSS.AMA.md) | Use Azure Monitor Agent for collecting monitoring data from VM scale sets. | Important
[Azure.VMSS.ComputerName](../rules/Azure.VMSS.ComputerName.md) | Virtual Machine Scale Set (VMSS) computer name should meet naming requirements. | Awareness
[Azure.VMSS.MigrateAMA](../rules/Azure.VMSS.MigrateAMA.md) | Use Azure Monitor Agent as replacement for Log Analytics Agent. | Important
[Azure.VMSS.Name](../rules/Azure.VMSS.Name.md) | Virtual Machine Scale Set (VMSS) names should meet naming requirements. | Awareness
[Azure.VMSS.PublicKey](../rules/Azure.VMSS.PublicKey.md) | Use SSH keys instead of common credentials to secure virtual machine scale sets against malicious activities. | Important
[Azure.VMSS.ScriptExtensions](../rules/Azure.VMSS.ScriptExtensions.md) | Custom Script Extensions scripts that reference secret values must use the protectedSettings. | Important
[Azure.VNET.BastionSubnet](../rules/Azure.VNET.BastionSubnet.md) | VNETs with a GatewaySubnet should have an AzureBastionSubnet to allow for out of band remote access to VMs. | Important
[Azure.VNET.FirewallSubnet](../rules/Azure.VNET.FirewallSubnet.md) | Use Azure Firewall to filter network traffic to and from Azure resources. | Important
[Azure.VNET.LocalDNS](../rules/Azure.VNET.LocalDNS.md) | Virtual networks (VNETs) should use DNS servers deployed within the same Azure region. | Important
[Azure.VNET.Name](../rules/Azure.VNET.Name.md) | Azure Resource Manager (ARM) has requirements for Virtual Network names. | Awareness
[Azure.VNET.PeerState](../rules/Azure.VNET.PeerState.md) | VNET peering connections must be connected. | Important
[Azure.VNET.SingleDNS](../rules/Azure.VNET.SingleDNS.md) | Virtual networks (VNETs) should have at least two DNS servers assigned. | Important
[Azure.VNET.SubnetName](../rules/Azure.VNET.SubnetName.md) | Azure Resource Manager (ARM) has requirements for Virtual Network Subnet names. | Awareness
[Azure.VNET.UseNSGs](../rules/Azure.VNET.UseNSGs.md) | Virtual network (VNET) subnets should have Network Security Groups (NSGs) assigned. | Critical
[Azure.VNG.ConnectionName](../rules/Azure.VNG.ConnectionName.md) | Virtual Network Gateway (VNG) connection names should meet naming requirements. | Awareness
[Azure.VNG.ERAvailabilityZoneSKU](../rules/Azure.VNG.ERAvailabilityZoneSKU.md) | Use availability zone SKU for virtual network gateways deployed with ExpressRoute gateway type. | Important
[Azure.VNG.ERLegacySKU](../rules/Azure.VNG.ERLegacySKU.md) | Migrate from legacy SKUs to improve reliability and performance of ExpressRoute (ER) gateways. | Critical
[Azure.VNG.Name](../rules/Azure.VNG.Name.md) | Virtual Network Gateway (VNG) names should meet naming requirements. | Awareness
[Azure.VNG.VPNActiveActive](../rules/Azure.VNG.VPNActiveActive.md) | Use VPN gateways configured to operate in an Active-Active configuration to reduce connectivity downtime. | Important
[Azure.VNG.VPNAvailabilityZoneSKU](../rules/Azure.VNG.VPNAvailabilityZoneSKU.md) | Use availability zone SKU for virtual network gateways deployed with VPN gateway type. | Important
[Azure.VNG.VPNLegacySKU](../rules/Azure.VNG.VPNLegacySKU.md) | Migrate from legacy SKUs to improve reliability and performance of VPN gateways. | Critical
[Azure.vWAN.Name](../rules/Azure.vWAN.Name.md) | Virtual WAN (vWAN) names should meet naming requirements. | Awareness
[Azure.WebPubSub.ManagedIdentity](../rules/Azure.WebPubSub.ManagedIdentity.md) | Configure Web PubSub Services to use managed identities to access Azure resources securely. | Important
[Azure.WebPubSub.SLA](../rules/Azure.WebPubSub.SLA.md) | Use SKUs that include an SLA when configuring Web PubSub Services. | Important
