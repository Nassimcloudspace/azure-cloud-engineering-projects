# Azure Backup & File Recovery

## Overview

This project demonstrates how to protect an Azure Virtual Machine using Azure Backup, create recovery points, and recover deleted files using Azure File Recovery.

The objective was to gain hands-on experience with Azure Backup, Recovery Services Vaults, recovery points, and file-level recovery.

---

## Project Objectives

* Create an Azure Virtual Machine
* Configure a Recovery Services Vault
* Enable Azure Backup
* Create recovery points
* Simulate accidental file deletion
* Recover files from a backup
* Validate successful restoration

---

## Architecture

```text
Azure VM (VM1)
        │
        ▼
Azure Backup
        │
        ▼
Recovery Services Vault (RSV-BackupLab)
        │
        ▼
Recovery Points
        │
        ▼
File Recovery
```

---

## Azure Resources Used

| Resource Type           | Name                           |
| ----------------------- | ------------------------------ |
| Resource Group          | RG-BackupLab                   |
| Virtual Machine         | VM1                            |
| Operating System        | Windows Server 2025 Datacenter |
| Recovery Services Vault | RSV-BackupLab                  |
| Backup Policy           | DefaultPolicy (Standard)       |

---

## Implementation

### Step 1 - Create the Virtual Machine

A Windows Server virtual machine named **VM1** was deployed in Azure.

Configuration:

* Windows Server 2025 Datacenter
* Standard B2as_v2 VM Size
* Public IP Address
* RDP Enabled

---

### Step 2 - Create a Recovery Services Vault

A Recovery Services Vault named **RSV-BackupLab** was created to store and manage backups.

Configuration:

* Backup Storage Redundancy: Geo-Redundant Storage (GRS)

---

### Step 3 - Enable Azure Backup

Azure Backup was configured for VM1 using the Recovery Services Vault.

Backup Policy:

* Standard Policy
* Daily Backup Schedule
* 30-Day Retention Period

---

### Step 4 - Create Test Data

A folder named:

```text
C:\LabData
```

was created on the virtual machine.

Two test files were added:

```text
File1.txt
File2.txt
```

---

### Step 5 - Create Recovery Points

Manual backups were executed using the **Backup Now** option.

Result:

* Recovery Point 1 created successfully
* Recovery Point 2 created successfully

Both recovery points appeared in Azure Backup.

---

### Step 6 - File Recovery

Azure File Recovery was initiated from the latest recovery point.

Process:

1. Selected a recovery point
2. Downloaded the recovery executable
3. Executed the recovery script
4. Connected to the recovery point using iSCSI

Recovery disks were mounted as temporary drives.

Example:

```text
E:
F:
G:
```

---

### Step 7 - Recover Files

The mounted recovery disk was browsed to locate the backed-up data.

Location:

```text
E:\LabData
```

Recovered files:

```text
File1.txt
File2.txt
```

The files were copied back to the production environment.

---

### Step 8 - Cleanup

After validation:

* Recovery disks were unmounted
* Recovery session was closed
* Virtual machine was stopped (deallocated)

---

## Validation

The following checks were completed successfully:

* Recovery Services Vault created
* Azure Backup enabled
* Recovery points generated
* Recovery disks mounted
* Files recovered successfully
* Recovery session unmounted correctly

---

