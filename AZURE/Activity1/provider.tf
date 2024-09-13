terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "0894ba97-b6cf-44f1-a2f9-05e20359dc64"
    features {}
}