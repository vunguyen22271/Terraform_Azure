# Resource_1: Resource Group
resource "azurerm_resource_group" "rg" {
  count    = 3
  name     = "myrg${count.index}"
  location = "East US"
}