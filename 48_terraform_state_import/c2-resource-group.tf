# terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example
# terraform import azurerm_resource_group.example /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>
# terraform import azurerm_resource_group.myrg /subscriptions/82808767-144c-4c66-a320-b30791668b0a/resourceGroups/myrg1
/*
# Resource Group
resource "azurerm_resource_group" "myrg" {
   name = "myrg1"
   location = "eastus"
   tags = {
     "Tag1" = "My-Tag-1"
   }
}
*/

# Create Azure Resource Group Resource - Basic Version to get Terraform Resource Type and Resource Local Name we are going to use in Terraform
# Resource Group
resource "azurerm_resource_group" "myrg" {
  name     = "myrg1"
  location = "eastus"
}

# terraform import azurerm_resource_group.myrg /subscriptions/7a70b68e-db53-4f72-b92d-0309864b1e4a/resourceGroups/myrg1