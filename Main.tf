##########################################################
#This is a developement script for deploying a windows VM#
##########################################################

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}
provider "azurerm" { 
    features{}
    subscription_id = var.subscription_id 
  }

resource "azurerm_resource_group" "rg" { 
    name = var.resource_group_name
    location = "westus" 
    }

resource "azurerm_storage_account" "st" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = "westus"
  account_tier = var.account_tier_type
  account_replication_type = var.Account_rep_type
}

resource "azurerm_virtual_network" "example" {
  name = "example-network"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "example" {
  name = "internal"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name = "example-nic"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.example.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name = "example-machine"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  size = var.size
  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer = var.offer
    sku = var.sku
    version   = "latest"

  }
}
