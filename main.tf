terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"

  backend "azurerm" {
    resource_group_name  = "Devops-RG"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "terraform1601"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "terraform"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "azure-terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev-rg" {
  name =  "dev-rg"
  location = "eastus"
}


resource "azurerm_resource_group" "prod-rg" {
  name =  "prod-rg"
  location = "eastus"
}

/*
resource "azurerm_resource_group" "test-rg-count" {
  count = 3
  name =  "test-rg-${count.index}"
  location = "eastus"
}

*/