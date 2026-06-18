# Azure RBAC & Role-Based Access Control

# Overview

This project demonstrates how to implement Azure Role-Based Access Control (RBAC) using Microsoft Entra ID security groups and Azure built-in roles.

The objective was to gain hands-on experience with identity management, role assignments, scope inheritance, and least-privilege access within Azure.

---

## Project Objectives

- Create Microsoft Entra ID security groups
- Configure Azure RBAC role assignments
- Assign permissions at subscription scope
- Assign permissions at resource group scope
- Assign permissions at resource scope
- Demonstrate RBAC inheritance
- Implement least-privilege access
- Validate role assignments

---

## Architecture

```text
Azure Subscription
│
├── IT-Admins
│   └── Contributor
│
├── Auditors
│   └── Reader
│
├── RG-Development
│   └── Developers
│       └── Virtual Machine Contributor
│
└── Storage Account
    └── Storage-Team
        └── Storage Blob Data Contributor
```

---

## Azure Resources Used

| Resource Type | Name |
|--------------|------|
| Subscription | Azure subscription 1 |
| Resource Group | RG-Production |
| Resource Group | RG-Development |
| Resource Group | RG-Networking |
| Microsoft Entra Group | IT-Admins |
| Microsoft Entra Group | Developers |
| Microsoft Entra Group | Auditors |
| Microsoft Entra Group | Storage-Team |
| Storage Account | stgprodnassim01 |
| Blob Container | project-data |

---

## Implementation

### Step 1 - Create Resource Groups

Three resource groups were created to simulate a production Azure environment.

**Resource Groups**

- RG-Production
- RG-Development
- RG-Networking

**Purpose**

- Separate workloads by function
- Demonstrate RBAC scope assignment
- Simulate enterprise resource organization

---

### Step 2 - Create Microsoft Entra ID Groups

Four Microsoft Entra ID security groups were created.

**Groups**

- IT-Admins
- Developers
- Auditors
- Storage-Team

**Purpose**

- Centralized access management
- Group-based RBAC assignments
- Reduced administrative overhead

---

### Step 3 - Assign Contributor Role

The Contributor role was assigned to the IT-Admins group.

**Configuration**

**Role**

- Contributor

**Scope**

- Azure subscription 1

**Result**

- Full management access across all resource groups
- No ability to assign RBAC roles

---

### Step 4 - Assign Virtual Machine Contributor Role

The Developers group was granted Virtual Machine Contributor permissions.

**Configuration**

**Role**

- Virtual Machine Contributor

**Scope**

- RG-Development

**Result**

- Manage virtual machines in development
- No access to production resources
- No RBAC administration permissions

---

### Step 5 - Assign Reader Role

The Auditors group was assigned the Reader role.

**Configuration**

**Role**

- Reader

**Scope**

- Azure subscription 1

**Result**

- View all Azure resources
- No modification permissions

---

### Step 6 - Create Storage Account

A Storage Account was created to demonstrate resource-level RBAC.

**Configuration**

**Storage Type**

- Azure Blob Storage

**Performance**

- Standard

**Redundancy**

- Locally Redundant Storage (LRS)

**Container**

- project-data

---

### Step 7 - Assign Storage Blob Data Contributor Role

The Storage-Team group was granted access to blob data.

**Configuration**

**Role**

- Storage Blob Data Contributor

**Scope**

- Storage Account

**Result**

- Upload blobs
- Download blobs
- Delete blobs
- Manage blob data

**Restrictions**

- Cannot delete storage account
- Cannot modify networking settings
- Cannot manage RBAC assignments

---

## Validation

The following checks were completed successfully:

- Microsoft Entra groups created
- Resource groups created
- Contributor role assigned
- Reader role assigned
- Virtual Machine Contributor role assigned
- Storage Blob Data Contributor role assigned
- RBAC scope inheritance validated
- Least-privilege access implemented

---

## Key Concepts Demonstrated

### Azure RBAC

- Built-in roles
- Role assignments
- Access management

### Microsoft Entra ID

- Security groups
- Identity management
- Group-based administration

### Scope Inheritance

Role assignments applied at:

- Subscription level
- Resource group level
- Resource level

Permissions inherited downward according to Azure RBAC hierarchy.

### Least Privilege

Each team received only the permissions required to perform its responsibilities.

---

## Lessons Learned

- Azure RBAC should be assigned to groups rather than individual users.
- Subscription-level assignments inherit permissions to lower scopes.
- Resource-level assignments provide granular access control.
- Data-plane roles differ from management-plane roles.
- Least-privilege access improves security and governance.
- Microsoft Entra ID groups simplify access management in Azure environments.

...
