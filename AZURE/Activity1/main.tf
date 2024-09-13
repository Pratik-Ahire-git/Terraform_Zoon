resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "storage302"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    "Enviroment" = "storage"
  }
}