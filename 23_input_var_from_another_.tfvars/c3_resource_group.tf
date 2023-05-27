# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "${var.resoure_group_name}"
  location = "${var.resoure_group_location}"
  tags = {
    business_unit = "${var.business_unit}"
    resoure_group_name = "${var.resoure_group_name}"
    virtual_network_name = "${var.virtual_network_name}"
    subnet_name = "${var.subnet_name}"
    environment = "${var.environment}"
    resoure_group_location = "${var.resoure_group_location}"
  }
}
