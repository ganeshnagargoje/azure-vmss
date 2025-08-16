terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.8.0"
        }
    }
    required_version = ">= 1.9.0"
}

provider "azurerm" {
  features { }
  subscription_id = "ENTER_SUBSCRIPTION_ID"
  client_id       = "ENTER_CLIENT_ID"
  client_secret   = "ENTER_CLIENT_SECRET"
  tenant_id       = "ENTER_TENANT_ID"
}
