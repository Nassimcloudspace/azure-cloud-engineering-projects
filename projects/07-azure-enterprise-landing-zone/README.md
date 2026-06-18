# Azure Enterprise Landing Zone

## Overview

This project demonstrates the implementation of an Azure Enterprise Landing Zone designed to establish governance, security, networking, monitoring, and cost management foundations for cloud workloads.

The objective was to gain hands-on experience with Azure Management Groups, Azure Policy, Azure Bastion, Microsoft Defender for Cloud, Azure Key Vault, centralized monitoring, and hub-and-spoke networking architecture.

---

## Project Objectives

- Implement centralized governance using Management Groups
- Enforce organizational standards using Azure Policy
- Configure mandatory resource tagging
- Restrict resource deployments to approved regions
- Implement resource protection using Azure Locks
- Enable centralized monitoring with Log Analytics
- Enable Microsoft Defender for Cloud
- Configure cost governance using Azure Budgets
- Deploy a Hub-and-Spoke network architecture
- Configure VNet Peering
- Deploy Azure Bastion for secure VM administration
- Implement secrets management using Azure Key Vault

---

## Architecture
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/aebf1bb1-fd34-47d8-ad41-5d30385cfd33" />
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/b8447968-6734-4c6e-9ab7-51476e480e67" />


---

## Azure Resources Used

| Resource Type | Resource Name |
|---------------|--------------|
| Management Group | Nassimenterprises |
| Resource Group | RG-Networking |
| Resource Group | RG-Development |
| Resource Group | RG-Production |
| Virtual Network | hub-vnet |
| Virtual Network | spoke-dev-vnet |
| Virtual Network | spoke-prod-vnet |
| Azure Bastion | Azure Bastion Host |
| Log Analytics Workspace | law-nassimenterprises-prod |
| Azure Key Vault | kv-nassim-prod |
| Microsoft Defender for Cloud | Enabled |
| Azure Budget | LandingZone-Monthly-Budget |
| Resource Lock | Production Resource Lock |

---

# Implementation

## Step 1 - Create Management Group

A Management Group named **Nassimenterprises** was created to provide centralized governance and policy inheritance.

### Benefits

- Centralized governance
- Policy inheritance
- RBAC inheritance
- Enterprise resource organization

---

## Step 2 - Create Resource Groups

The environment was separated into dedicated resource groups.

### Resource Groups

- RG-Networking
- RG-Development
- RG-Production

### Benefits

- Administrative separation
- Better resource organization
- Simplified access management

---

## Step 3 - Implement Azure Policy

Azure Policies were assigned at the Management Group scope.

### Policies Implemented

#### Require Environment Tag

Ensures all resources include an Environment tag.

Examples:

- Development
- Test
- Production

#### Require Owner Tag

Ensures resource ownership is clearly identified.

#### Require CostCenter Tag

Supports chargeback and budget tracking.

#### Restrict Resource Locations

Limits deployments to approved Azure regions.

Allowed Region:

- East US

### Benefits

- Governance enforcement
- Compliance
- Cost accountability
- Standardization

---

## Step 4 - Configure Resource Locks

Resource locks were implemented to protect critical production resources.

### Lock Type

Delete Lock

### Benefits

- Prevent accidental deletion
- Improve operational stability

---

## Step 5 - Configure Centralized Monitoring

A Log Analytics Workspace was deployed.

### Workspace

```text
law-nassimenterprises-prod
```

### Configuration

- Azure Monitor integration
- Log collection
- Security event collection
- Defender for Cloud integration

### Benefits

- Centralized monitoring
- Performance analysis
- Security investigations
- Operational visibility

---

## Step 6 - Enable Microsoft Defender for Cloud

Microsoft Defender for Cloud was enabled to continuously assess the environment.

### Features

- Secure Score
- Security Recommendations
- Regulatory Compliance
- Threat Protection
- Security Posture Management

### Benefits

- Continuous monitoring
- Security best-practice guidance
- Compliance reporting

---

## Step 7 - Configure Cost Management

A monthly Azure Budget was created.

### Configuration

Budget Name:

```text
LandingZone-Monthly-Budget
```

Alerts:

- 80% Budget Threshold
- 100% Budget Threshold

### Benefits

- Cost visibility
- Spending control
- Budget governance

---

## Step 8 - Deploy Hub-and-Spoke Networking

A hub-and-spoke network architecture was implemented.

### Hub Network

| Property | Value |
|-----------|--------|
| Name | hub-vnet |
| Address Space | 10.0.0.0/16 |

### Development Spoke

| Property | Value |
|-----------|--------|
| Name | spoke-dev-vnet |
| Address Space | 10.1.0.0/16 |

### Production Spoke

| Property | Value |
|-----------|--------|
| Name | spoke-prod-vnet |
| Address Space | 10.2.0.0/16 |

### Benefits

- Network segmentation
- Centralized connectivity
- Scalable architecture
- Improved security boundaries

---

## Step 9 - Configure VNet Peering

Bidirectional peering was configured between the Hub and Spoke networks.

### Peerings

- hub-to-dev
- dev-to-hub
- hub-to-prod
- prod-to-hub

### Benefits

- Private connectivity
- Azure backbone communication
- Low latency networking

---

## Step 10 - Deploy Azure Bastion

Azure Bastion was deployed in the Hub VNet.

### Configuration

Subnet:

```text
AzureBastionSubnet
```

Purpose:

- Secure RDP access
- Secure SSH access
- No public IP required on VMs

### Connection Flow

```text
User
  │
  ▼
Azure Bastion
  │
  ▼
Hub VNet
  │
  ▼
Spoke VNet
  │
  ▼
Virtual Machine
```

### Benefits

- Reduced attack surface
- Browser-based access
- Secure administration
- Eliminates public VM exposure

---

## Step 11 - Deploy Azure Key Vault

Azure Key Vault was deployed to securely store secrets.

### Key Vault

```text
kv-nassim-prod
```

### Configuration

- Azure RBAC Authorization
- Soft Delete Enabled
- Secure Secret Storage

### Secret Created

```text
userpassword
```

### Benefits

- Centralized secrets management
- Secure credential storage
- Reduced credential exposure

---

# Validation

The following components were successfully implemented:

- Management Group
- Azure Policies
- Resource Locks
- Cost Management Budget
- Log Analytics Workspace
- Microsoft Defender for Cloud
- Hub VNet
- Development Spoke VNet
- Production Spoke VNet
- VNet Peering
- Azure Bastion
- Azure Key Vault
- Secret Storage

---

# Key Concepts Demonstrated

## Governance

- Azure Management Groups
- Azure Policy
- Resource Locks
- Resource Tagging

## Security

- Microsoft Defender for Cloud
- Azure Key Vault
- Azure Bastion
- RBAC Authorization

## Networking

- Hub-and-Spoke Architecture
- Virtual Networks
- VNet Peering
- Network Segmentation

## Operations

- Log Analytics Workspace
- Azure Monitor
- Budget Management
- Cost Governance

---

# Lessons Learned

- Azure Management Groups simplify governance at scale.
- Azure Policy enforces organizational standards automatically.
- Hub-and-spoke networking provides a scalable enterprise network design.
- Azure Bastion enables secure administration without exposing public IP addresses.
- Microsoft Defender for Cloud improves visibility into security posture.
- Azure Key Vault centralizes and secures sensitive information.
- Log Analytics Workspace provides centralized monitoring and troubleshooting capabilities.
- Budgets and alerts help maintain financial control over Azure resources.

---

