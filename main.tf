terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.93.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "eb3cbc5a-fb40-47e3-b0d0-0440562dd5cc"
  client_id       = "5da25d42-b7c8-4fbf-a3e1-aa0c78fc43d7"
  client_secret   = "swu8Q~yg-sX8-i5L5KYUwq8KDKQmNSPK8nWzScI8"
  tenant_id       = "48ee478e-1f4c-405c-97b7-323392252940"
  features {}
}

locals {
  resource_group_name="app-grp"
  location="North Europe"
  virtual_network = {
    name="app-network"
    address_space="10.0.0.0/16"
}
}

resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location  
}


resource "azurerm_virtual_network" "appnetwork" {
  name                = local.virtual_network.name
  location            = local.location  
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]

  subnet {
    name           = "subnetA"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "subnetB"
    address_prefix = "10.0.1.0/24"    
  }
}


