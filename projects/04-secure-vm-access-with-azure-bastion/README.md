# Secure VM Access with Azure Bastion

## Project Overview

This project demonstrates how to securely administer Azure virtual machines without exposing SSH (22) or RDP (3389) to the Internet.

Azure Bastion provides browser-based connectivity to virtual machines over HTTPS (443), allowing secure access to private VMs while reducing the attack surface.

---

## Architecture

Azure Bastion was deployed within a dedicated AzureBastionSubnet and used to establish secure browser-based SSH connectivity to a virtual machine that has no public IP address.

---

## Components

| Component | Purpose |
|------------|---------|
| Azure Bastion | Secure browser-based VM access |
| Virtual Network | Provides private network connectivity |
| AzureBastionSubnet | Dedicated subnet required for Bastion |
| Linux Virtual Machine | Target VM for administration |
| Public IP (Bastion) | Secure entry point for administrators |
| Private IP (VM) | Internal-only VM connectivity |

---

## Implementation Steps

### 1. Create Virtual Network

Created a virtual network with a dedicated Azure Bastion subnet.

### 2. Deploy Virtual Machine

Deployed an Ubuntu virtual machine without a public IP address.

### 3. Deploy Azure Bastion

Created an Azure Bastion host within the AzureBastionSubnet.

### 4. Connect Using Bastion

Established a secure SSH session directly from the Azure Portal browser.

### 5. Verify Private Connectivity

Confirmed that the virtual machine is reachable using only its private IP address.

---

## Security Benefits

- No public IP assigned to the virtual machine
- No inbound SSH (22) exposure to the Internet
- Secure browser-based administration
- Reduced attack surface
- Centralized administrative access

---

## Skills Demonstrated

- Azure Bastion
- Virtual Networking
- Subnet Design
- Network Security
- Linux Administration
- Secure Remote Access
- Private IP Addressing

---

## AZ-104 Objectives Covered

- Configure secure access to virtual networks
- Implement Azure Bastion
- Create and configure virtual networks and subnets
- Create and configure virtual machines
- Configure network security
