variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
  validation {
    condition     = contains(["East US", "Central India", "South India"], var.location)
    error_message = "Only 'East US', 'Central India', and 'South India' are allowed for deployment."
  }
  
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "lrnvmss-rg"
  
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "lrnvmss-vnet"

}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "lrnvmss-subnet"

}

# Azure VMSS VNet Configuration
variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/20"]
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
  default     = "lrnvmss-nsg"

}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lrnvmss-lb"

}

variable "lb_ip_name" {
  description = "The name of the load balancer public IP"
  type        = string
  default     = "lrnvmss-lb-ip"

}

variable "lb_frontend_ip_name" {
  description = "The name of the load balancer frontend IP configuration"
  type        = string
  default     = "lrnvmss-lb-fe"
  
}
variable "lb_backend_pool_name" {
  description = "The name of the load balancer backend pool"
  type        = string
  default     = "lrnvmss-lb-backend"

}

variable "lb_rule_http_name" {
  description = "The name of the load balancer HTTP rule"
  type        = string
  default     = "lrnvmss-lb-rule-http"

}

variable "lb_probe_http_name" {
  description = "The name of the load balancer HTTP probe"
  type        = string
  default     = "lrnvmss-lb-probe-http"

}

variable "lb_nat_rule_ssh_name" {
  description = "The name of the load balancer NAT rule for SSH"
  type        = string
  default     = "lrnvmss-lb-nat-rule-ssh"

}

variable "nat_gw_ip_name" {
  description = "The name of the NAT gateway public IP"
  type        = string
  default     = "lrnvmss-nat-gw-ip"

}

variable "vmss_terraform" {
  description = "The name of the VMSS"
  type        = string
  default     = "vmss-terraform"

}

variable "nat_gateway_name" {
  description = "The name of the NAT gateway"
  type        = string
  default     = "lrnvmss-nat-gateway"
  
}