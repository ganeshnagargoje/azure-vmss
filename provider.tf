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
  subscription_id = "58fe3d3b-d43d-47d7-b55e-3bbd6b8cca46"
  client_id       = "e3ff3340-a993-4a15-9438-aaecbf8440ac"
  client_secret   = "hcV8Q~15kkrAI~aCEGq2yuHLESAANF.Gzx.IAaJY"
  tenant_id       = "864453cc-5ccb-4beb-b1c0-b49ca424962e"
}