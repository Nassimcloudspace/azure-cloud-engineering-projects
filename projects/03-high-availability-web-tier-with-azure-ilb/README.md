# Azure Internal Load Balancer with Health Probes

## Project Overview

This project demonstrates how to deploy a highly available web tier in Azure using:

- Azure Virtual Network
- Azure Virtual Machines
- Network Security Groups
- Azure Internal Load Balancer
- Health Probes
- Load Balancing Rules

The solution distributes HTTP traffic across two backend Nginx web servers and automatically removes unhealthy instances from service.

---

## Architecture

The environment consists of:

- One client virtual machine used for testing
- An Azure Internal Load Balancer with a private frontend IP
- Two Ubuntu virtual machines running Nginx
- A health probe monitoring backend availability on port 80

Traffic is sent to the Internal Load Balancer, which distributes requests across healthy backend servers.

---

## Components

| Component | Purpose |
|------------|---------|
| client-vm | Generates HTTP requests |
| Internal Load Balancer | Distributes traffic |
| vm-web-01 | Backend Nginx web server |
| vm-web-02 | Backend Nginx web server |
| Health Probe | Monitors backend availability |

---

## Implementation Steps

### 1. Create Virtual Network

Created a virtual network and subnet for all resources.

### 2. Deploy Backend Web Servers

Deployed two Ubuntu virtual machines and installed Nginx.

### 3. Configure Internal Load Balancer

Configured a frontend private IP and backend pool.

### 4. Configure Health Probe

Created a TCP health probe on port 80.

### 5. Configure Load Balancing Rule

Configured HTTP traffic distribution from the frontend IP to the backend pool.

### 6. Validate Traffic Distribution

Verified that requests were distributed across both backend servers.

### 7. Test Health Probe Failover

Stopped Nginx on one backend server and verified that traffic continued flowing only to healthy instances.

---

## Validation

Traffic was tested using a dedicated client virtual machine.

Example:

```bash
curl http://10.0.0.10
```

Responses were successfully received from both backend servers, confirming proper load balancing.

After stopping Nginx on one backend server, the health probe automatically removed the unhealthy instance from rotation and traffic continued to be served by the remaining healthy server.

---

## Skills Demonstrated

- Virtual Networking
- Azure Load Balancer
- Health Probes
- Network Security Groups
- Linux Administration
- Nginx Configuration
- High Availability Design
- Network Troubleshooting

---

## AZ-104 Objectives Covered

- Configure and manage virtual networks and subnets
- Configure network security groups
- Configure internal load balancers
- Troubleshoot load balancing
- Deploy and manage virtual machines
