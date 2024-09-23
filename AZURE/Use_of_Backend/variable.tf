variable "azure_resource_group" {
    type = object({
      name = string
      location = string
    })
    default = {
      name = "example"
      location = "East US"
    }
    description = "azure resource group"
  
}