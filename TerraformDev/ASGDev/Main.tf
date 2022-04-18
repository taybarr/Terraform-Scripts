##########################################################
#This is a developement script for deploying Application #
#Security Groups                                         #
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
  resource "azurerm_resource_group" "example" {
  name     = "tf-test"
  location = "West Europe"
}

resource "azurerm_application_security_group" "example" {
  name                = "tf-appsecuritygroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

/*   tags = {
    Hello = "World"
  } */
}