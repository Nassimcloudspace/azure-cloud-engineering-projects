# Azure Governance Landing Zone with Hub and Spoke Network

## Overview

This project demonstrates the implementation of an Azure Enterprise Landing Zone designed to establish governance, security, networking, monitoring, and cost management foundations for cloud workloads.

The objective was to gain hands-on experience with Azure Management Groups, Azure Policy, hub-and-spoke networking, centralized monitoring, Microsoft Defender for Cloud, Key Vault, and enterprise governance practices.

---

## Project Objectives

- Create an Azure Management Group hierarchy
- Implement Azure Policy governance controls
- Enforce mandatory resource tagging
- Configure centralized monitoring
- Enable Microsoft Defender for Cloud
- Implement cost management and budgets
- Create hub-and-spoke network architecture
- Configure VNet peering
- Deploy Azure Key Vault for secrets management
- Apply resource protection and governance controls

---

## Architecture

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/168a04eb-5d68-416e-81db-fde3ddd17d5e" />
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/93e540bb-23df-4d83-93db-626fd3fe68b9" />




---

## Azure Resources Used

| Resource Type | Name |
|--------------|------|
| Management Group | Nassimenterprises |
| Subscription | Azure subscription 1 |
| Resource Group | RG-Production |
| Resource Group | RG-Development |
| Resource Group | RG-Networking |
| Virtual Network | hub-vnet |
| Virtual Network | spoke-dev-vnet |
| Virtual Network | spoke-prod-vnet |
| Log Analytics Workspace | law-nassimenterprises-prod |
| Azure Key Vault | kv-nassim-prod |
| Microsoft Defender for Cloud | Enabled |
| Budget | Monthly Budget |
| Resource Lock | RG-Production Lock |

---

## Implementation

### Step 1 - Create Management Group

A Management Group named **Nassimenterprises** was created to provide centralized governance across Azure resources.

### Step 2 - Create Resource Groups

Three resource groups were created:

- RG-Production
- RG-Development
- RG-Networking

### Step 3 - Implement Azure Policy

Azure Policies were assigned at the Management Group level.

Policies implemented:

- Require Environment Tag
- Require Owner Tag
- Require CostCenter Tag
- Restrict Resource Deployment Region (East US)

### Step 4 - Configure Resource Protection

A resource lock was applied to protect critical resources from accidental deletion.

### Step 5 - Create Log Analytics Workspace

A centralized Log Analytics Workspace was deployed.

**Workspace**

```text
law-nassimenterprises-prod
```

### Step 6 - Enable Microsoft Defender for Cloud

Microsoft Defender for Cloud was enabled to provide security recommendations and posture management.

Capabilities include:

- Secure Score
- Security Recommendations
- Security Posture Assessment
- Threat Protection

### Step 7 - Configure Cost Management

A monthly Azure budget was created.

Configuration:

- Monthly Budget
- 80% Budget Alert
- 100% Budget Alert

### Step 8 - Deploy Hub-and-Spoke Networking

A hub-and-spoke network architecture was implemented.

**Hub Network**

```text
hub-vnet
10.0.0.0/16
```

**Development Network**

```text
spoke-dev-vnet
10.1.0.0/16
```

**Production Network**

```text
spoke-prod-vnet
10.2.0.0/16
```

### Step 9 - Configure VNet Peering

Virtual network peerings were established between the hub and spoke networks.

Peerings:

- Hub ↔ Development
- Hub ↔ Production

### Step 10 - Deploy Azure Key Vault

An Azure Key Vault was deployed for centralized secrets management.

**Key Vault**

```text
kv-nassim-prod
```

Configuration:

- Azure RBAC Authorization
- Soft Delete Enabled
- Secret Storage Configured

Secret created:

```text
userpassword
```

---

## Validation

The following checks were completed successfully:

- Management Group created
- Azure Policies assigned
- Mandatory tags enforced
- Resource Lock configured
- Log Analytics Workspace deployed
- Microsoft Defender for Cloud enabled
- Budget alerts configured
- Hub VNet deployed
- Development Spoke VNet deployed
- Production Spoke VNet deployed
- VNet Peering configured
- Azure Key Vault deployed
- Secret stored successfully

---

## Key Concepts Demonstrated

### Azure Governance

- Management Groups
- Azure Policy
- Resource Locks
- Resource Tagging

### Azure Networking

- Hub-and-Spoke Architecture
- Virtual Networks
- VNet Peering
- Network Segmentation

### Azure Security

- Microsoft Defender for Cloud
- Azure Key Vault
- RBAC Authorization
- Secrets Management

### Azure Operations

- Log Analytics Workspace
- Monitoring
- Cost Management
- Budget Controls

---

## Lessons Learned

- Azure Management Groups provide centralized governance and policy inheritance.
- Azure Policy helps enforce organizational standards and compliance requirements.
- Resource tagging improves visibility, accountability, and cost tracking.
- Hub-and-spoke networking provides scalable enterprise network architecture.
- Microsoft Defender for Cloud strengthens security posture through continuous assessment.
- Azure Key Vault centralizes secret management and reduces credential exposure risks.
- Log Analytics Workspace enables centralized monitoring and operational visibility.
- Budget alerts help control cloud spending and improve financial governance.
