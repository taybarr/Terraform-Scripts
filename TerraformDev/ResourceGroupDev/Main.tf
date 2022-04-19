#################################################################
#This is a developement script for configuring Resource Groups  #
#Note that the resource group location is set to westus, change #
#if needed. Variables located in ResourceGroup.tfvars           #
#################################################################

terraform {
  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}
provider "azurerm" { 
    features{}
    subscription_id = var.subscription_id 
  }

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "westus"
}
