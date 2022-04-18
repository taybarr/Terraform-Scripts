########################################################
#This is a developement script for creating user roles#
########################################################

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

  #Built-in Roles#
  data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "example" {
}

resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.example.object_id
}

#Custom Role & User#
data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "example" {
}

resource "azurerm_role_definition" "example" {
  role_definition_id = "00000000-0000-0000-0000-000000000000"
  name               = "my-custom-role-definition"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions     = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

resource "azurerm_role_assignment" "example" {
  name               = "00000000-0000-0000-0000-000000000000"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.example.role_definition_resource_id
  principal_id       = data.azurerm_client_config.example.object_id
}
/*   tags = {
    Hello = "World"
  } */
