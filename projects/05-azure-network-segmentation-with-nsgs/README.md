# Azure Network Segmentation with NSGs

## Project Overview

This project demonstrates how to implement network segmentation in Azure using Virtual Networks, Subnets, and Network Security Groups (NSGs).

The environment consists of three network tiers:

- Web Tier
- Database Tier
- Client Tier

A custom NSG rule was implemented to block HTTP traffic from the client subnet to the database subnet while still allowing access to the web tier.

---

## Architecture

<img width="1536" height="1024" alt="11-architecture-diagram" src="https://github.com/user-attachments/assets/58dcbac7-f6ba-43eb-b898-a89356fa9d94" />


---

## Components

| Component | Purpose |
|------------|----------|
| Virtual Network | Provides network isolation |
| web-subnet | Hosts web server |
| db-subnet | Hosts database server |
| client-subnet | Used for connectivity testing |
| web-nsg | Controls web subnet traffic |
| db-nsg | Controls database subnet traffic |
| vm-web | Nginx web server |
| vm-db | Simulated database server |
| client-vm | Test client |

---

## Network Design

### Virtual Network

```text
10.0.0.0/16
```

### Subnets

| Subnet | Address Space |
|----------|----------|
| web-subnet | 10.0.1.0/24 |
| db-subnet | 10.0.2.0/24 |
| client-subnet | 10.0.3.0/24 |

---

## Implementation Steps

### 1. Create Virtual Network and Subnets

Created a virtual network with three dedicated subnets:

- web-subnet
- db-subnet
- client-subnet

---

### 2. Create Network Security Groups

Created:

- web-nsg
- db-nsg

Associated:

```text
web-subnet → web-nsg
db-subnet → db-nsg
```

---

### 3. Deploy Virtual Machines

Created:

| VM | Subnet |
|------|------|
| vm-web | web-subnet |
| vm-db | db-subnet |
| client-vm | client-subnet |

---

### 4. Install Nginx

Configured Nginx on both servers.

#### vm-web

```bash
echo "Web Server" | sudo tee /var/www/html/index.html
```

#### vm-db

```bash
echo "Database Server" | sudo tee /var/www/html/index.html
```

---

### 5. Verify Initial Connectivity

From client-vm:

```bash
curl http://10.0.1.4
```

Output:

```text
Web Server
```

```bash
curl http://10.0.2.4
```

Output:

```text
Database Server
```

This confirmed that Azure's default NSG rule:

```text
AllowVnetInBound
```

allowed communication between all subnets.

---

### 6. Create Custom NSG Rule

Created the following inbound rule on **db-nsg**:

| Setting | Value |
|----------|----------|
| Source | 10.0.3.0/24 |
| Protocol | TCP |
| Port | 80 |
| Action | Deny |
| Priority | 110 |
| Name | deny-client-http |

---

### 7. Validate Network Segmentation

#### Access to Web Server

```bash
curl http://10.0.1.4
```

Output:

```text
Web Server
```

#### Access to Database Server

```bash
curl http://10.0.2.4
```

Output:

```text
curl: (28) Failed to connect
```

Result:

```text
client-subnet → web-subnet     Allowed
client-subnet → db-subnet      Blocked
```

---

## Skills Demonstrated

- Azure Virtual Networks
- Subnet Design
- Network Security Groups (NSGs)
- Network Segmentation
- Linux Administration
- Nginx Configuration
- Connectivity Testing
- Azure Network Troubleshooting

---

## AZ-104 Objectives Covered

- Configure virtual networks and subnets
- Configure Network Security Groups
- Secure network traffic
- Implement network segmentation
- Troubleshoot network connectivity

---

## Key Takeaway

This project demonstrates how Azure Network Security Groups can enforce network segmentation between application tiers.

By applying a custom inbound rule to the database subnet, HTTP traffic from the client subnet was successfully blocked while access to the web tier remained available.
