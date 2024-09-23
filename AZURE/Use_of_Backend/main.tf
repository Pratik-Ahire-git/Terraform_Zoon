resource "azurerm_resource_group" "this" {
    name = var.azure_resource_group.name
    location = var.azure_resource_group.location
}

resource "azurerm_virtual_network" "this" {
    name = "Ntier"
    resource_group_name = azurerm_resource_group.this.name
    location = azurerm_resource_group.this.location
    address_space = ["10.0.0.0/16"]  
}