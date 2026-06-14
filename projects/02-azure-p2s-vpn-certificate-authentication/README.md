# Azure Point-to-Site VPN with Certificate Authentication

## Overview

This project demonstrates the deployment and configuration of an Azure Point-to-Site (P2S) VPN using certificate-based authentication.

The goal was to provide secure remote access to an Azure Virtual Network through an Azure VPN Gateway while gaining hands-on experience with Azure networking, certificate management, and VPN troubleshooting.

---

## Architecture

Client Device
↓
Point-to-Site VPN
↓
Azure VPN Gateway
↓
Azure Virtual Network (vnet-vpnlab)

---

## Technologies Used

- Microsoft Azure
- Azure Virtual Network (VNet)
- Azure VPN Gateway
- Point-to-Site VPN
- OpenVPN
- Azure VPN Client
- PowerShell
- Ubuntu Linux

---

## Implementation Steps

### 1. Create a Virtual Network

Created a Virtual Network named **vnet-vpnlab** with a dedicated GatewaySubnet.

### 2. Deploy Azure VPN Gateway

Configured:

- Gateway Type: VPN
- VPN Type: Route-based
- SKU: VpnGw1AZ

### 3. Configure Point-to-Site VPN

Configured:

- Tunnel Type: OpenVPN (SSL)
- Authentication Type: Azure Certificate
- Address Pool: 172.16.0.0/24

### 4. Generate Certificates

Created:

- Root Certificate (VPNRootCert)
- Client Certificate (VPNClientCert)

### 5. Upload Root Certificate

Uploaded the root certificate to the VPN Gateway Point-to-Site configuration.

### 6. Download VPN Client Configuration

Generated and downloaded the VPN client package from Azure.

### 7. Test Connectivity

Attempted connectivity using:

- Azure VPN Client (Windows)
- OpenVPN Client (Ubuntu Linux)

---

## Troubleshooting

During testing the VPN connection could not be fully established.

Observed error:

```text
Server did not respond properly to VPN Control Packets.
```

Troubleshooting included:

- Certificate validation
- VPN profile regeneration
- Gateway configuration review
- Azure VPN Client testing
- OpenVPN testing on Ubuntu
- Root certificate trust verification

---

## Skills Demonstrated

- Azure Networking
- Azure VPN Gateway Deployment
- Point-to-Site VPN Configuration
- Certificate-Based Authentication
- OpenVPN Configuration
- Network Troubleshooting
- Azure Administration

---

## Lessons Learned

This project provided practical experience with Azure VPN Gateway deployment, certificate management, client authentication, and VPN troubleshooting in a cloud networking environment.
