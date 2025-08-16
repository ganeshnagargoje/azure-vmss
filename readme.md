# Advanced Azure Infrastructure with Terraform - Hands-on Assignment
## Overview
This project outlines how to build a scalable web application infrastructure in Azure using Terraform. It includes setting up a Virtual Machine Scale Set (VMSS) behind a load balancer with appropriate security and auto-scaling configurations

## Requirements

### Resouce Group with location restriction
* Create a resource group in one of these regions:
   - East US
   - Central India
   - South India
Also create the validation rule that restrict other regions

### Networking
* Create a VNet with two subnets:
   - Application subnet (for vmss)
   - Management subnet (for future use)
* Configure an NSG that:
   - Only allows traffic from the load balancer to VMSS
   - Uses dynamic blocks for rule configuration
   - Denies all other inbound traffic

### Compute
* Set up a VMSS with:
   - Ubuntu 20.04 LTS
   - VM sizes with conditions based on environment(hint: use lookup function):
     * Dev: Standard_B1s
     * Stage: Standard_B2s
     * Prod: Standard_B2ms
* Configure auto-scaling:
   - Scale in when CPU < 10%
   - Scale out when CPU > 80%
   - Minimum instances: 2
   - Maximum instances: 5

### Load Balancer
* Create an Azure Load Balancer:
   - Public IP
   - Backend pool connected to VMSS
   - Health probe on port 80

## Technical Requirements

### Variables
* Create a terraform.tfvars file with:
   - Environment name
   - Region
   - Resource name prefix
   - Instance counts
   - Network address spaces

### Locals
* Implement locals block for:
   - Common tags
   - Resource naming convention
   - Network configuration

### Dynamic Blocks
* Use dynamic blocks for:
   - NSG rules
   - Load balancer rules
