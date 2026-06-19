# 08 - Azure Bicep CI/CD with Azure Pipelines

## Project Overview

This project demonstrates the implementation of a complete Infrastructure as Code (IaC) deployment pipeline using Azure Bicep, GitHub, and Azure DevOps Pipelines.

The objective was to gain hands-on experience with Infrastructure as Code, Azure DevOps CI/CD pipelines, Azure Service Connections, Azure CLI deployments, GitHub integration, and automated Azure resource provisioning.

---

## Architecture

```text
GitHub Repository
        │
        ▼
Azure DevOps Pipeline
        │
        ▼
Azure Service Connection
        │
        ▼
Azure CLI Deployment
        │
        ▼
Bicep Template
        │
        ▼
Azure Resource Group
        ├── Log Analytics Workspace
        └── Azure Key Vault
```

---

## Azure Resources Used

| Resource Type | Resource Name |
|--------------|--------------|
| Resource Group | RG-Development |
| Log Analytics Workspace | law-nassim-dev |
| Azure Key Vault | kv-nassim-dev-2026 |
| Azure DevOps Project | Azure-CICD-LandingZone |
| Azure Service Connection | Azure-ServiceConnection |
| GitHub Repository | azure-cloud-engineering-projects |
| Azure Pipeline | Azure Bicep Deployment Pipeline |

---

## Implementation

### Step 1 - Create Azure DevOps Project

An Azure DevOps project named **Azure-CICD-LandingZone** was created to host the CI/CD pipeline.

#### Benefits

- Centralized pipeline management
- Source control integration
- Automated deployment workflows
- DevOps lifecycle management

---

### Step 2 - Create Bicep Template

A Bicep template was created to deploy Azure infrastructure resources.

#### Resources Deployed

##### Log Analytics Workspace

- **Name:** law-nassim-dev

##### Azure Key Vault

- **Name:** kv-nassim-dev-2026

#### Resource Tags

```text
Environment = Development
Owner = Nassim
CostCenter = IT
```

#### Benefits

- Infrastructure as Code
- Repeatable deployments
- Version-controlled infrastructure
- Governance compliance

---

### Step 3 - Deploy and Validate Bicep Template

The Bicep template was manually deployed and validated using Azure CLI.

#### Deployment Command

```bash
az deployment group create \
  --resource-group RG-Development \
  --template-file main.bicep
```

#### Validation Command

```bash
az deployment group what-if \
  --resource-group RG-Development \
  --template-file main.bicep
```

#### Benefits

- Deployment validation
- Infrastructure testing
- Change impact analysis
- Deployment consistency

---

### Step 4 - Configure GitHub Repository

The Bicep templates and deployment files were stored in GitHub.

#### Repository

```text
azure-cloud-engineering-projects
```

#### Project Folder

```text
projects/08-azure-bicep-cicd-with-azure-pipelines
```

#### Benefits

- Version control
- Collaboration
- Source code management
- Auditability

---

### Step 5 - Configure Azure Service Connection

An Azure Resource Manager Service Connection was created in Azure DevOps.

#### Service Connection

```text
Azure-ServiceConnection
```

#### Authentication Method

```text
Service Principal
```

#### Benefits

- Secure Azure authentication
- Credential management
- Automated deployments
- Least privilege access

---

### Step 6 - Create Azure Pipeline

A YAML-based Azure DevOps Pipeline was created.

#### Initial Validation Pipeline

The first pipeline was used to validate Azure DevOps and GitHub integration.

#### Pipeline Tasks

- Pipeline trigger validation
- Agent provisioning
- YAML execution testing

#### Benefits

- CI/CD validation
- Pipeline testing
- Workflow verification

---

### Step 7 - Configure Bicep Deployment Pipeline

The pipeline was updated to deploy Azure resources automatically.

#### Pipeline Configuration

```yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: AzureCLI@2
  displayName: 'Deploy Bicep Template'
  inputs:
    azureSubscription: 'Azure-ServiceConnection'
    scriptType: 'bash'
    scriptLocation: 'inlineScript'
    inlineScript: |
      az deployment group create \
        --resource-group RG-Development \
        --template-file projects/08-azure-bicep-cicd-with-azure-pipelines/main.bicep
```

#### Benefits

- Automated deployments
- Continuous Integration
- Continuous Delivery
- Infrastructure automation

---

### Step 8 - Execute Deployment Pipeline

The Azure DevOps Pipeline was executed successfully.

#### Deployment Flow

```text
GitHub
   │
   ▼
Azure DevOps Pipeline
   │
   ▼
Azure Service Connection
   │
   ▼
Azure CLI
   │
   ▼
Bicep Deployment
   │
   ▼
Azure Resources
```

#### Benefits

- Fully automated deployment
- Reduced manual effort
- Consistent infrastructure provisioning
- Faster deployment cycles

---

## Validation

The following components were successfully implemented:

- Azure DevOps Project
- GitHub Integration
- Azure Service Connection
- Bicep Template Deployment
- Azure CLI Deployment
- Log Analytics Workspace
- Azure Key Vault
- Resource Tagging
- Azure DevOps YAML Pipeline
- Automated Infrastructure Deployment
- CI/CD Workflow

### Successful Pipeline Execution

```text
Stage: Succeeded
Job: Succeeded
Pipeline: Succeeded
```

### Successful Azure Deployment

```text
ProvisioningState: Succeeded
```

---

## Key Concepts Demonstrated

### Infrastructure as Code

- Azure Bicep
- Azure Resource Manager
- Declarative Deployments
- Resource Tagging

### DevOps

- Azure DevOps
- Azure Pipelines
- YAML Pipelines
- CI/CD Automation

### Source Control

- Git
- GitHub
- Version Control
- Repository Management

### Automation

- Azure CLI
- Service Connections
- Automated Deployments
- Deployment Validation

### Governance

- Resource Tagging
- Standardized Deployments
- Policy Compliance
- Repeatable Infrastructure

---

## Lessons Learned

- Bicep simplifies Infrastructure as Code deployments in Azure.
- Azure DevOps Pipelines automate infrastructure provisioning and deployment workflows.
- Azure Service Connections provide secure authentication between Azure DevOps and Azure.
- GitHub integration enables version-controlled infrastructure deployments.
- Azure CLI can be integrated directly into pipelines for automated resource deployment.
- Infrastructure as Code improves consistency, repeatability, and maintainability.
- Resource tagging helps support governance, ownership tracking, and cost management.
- CI/CD pipelines reduce manual deployment effort and improve deployment reliability.
