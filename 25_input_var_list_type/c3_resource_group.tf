# Resource_1: Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  location = var.resoure_group_location
}