terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.6"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  // subscription_id = "/subscriptions/9bca8b87-463a-46ec-bfa4-892365f5ede3/resourceGroups/DefaultResourceGroup-EUS2"
}

resource "azurerm_resource_group" "rg" {
  name     = "DefaultResourceGroup-EUS2"
  location = "East US 2"
}


resource "azurerm_storage_account" "storage" {
  name                     = "strgg12314555555"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
