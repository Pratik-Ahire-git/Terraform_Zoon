terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "storage"  
    storage_account_name = "astoragebackendpka"                      
    container_name       = "tfstate"                       # Name of the container
    key                  = "prod.terraform.tfstate"        # The name of the Blob used to retrieve/store Terraform's State file inside the Storage Containe
  }
}



provider "azurerm" {
  # Configuration options
  features {
    
  }
}