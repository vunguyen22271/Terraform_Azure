# # Resource: Linux Virtual Machine
# resource "azurerm_linux_virtual_machine" "linuxvm" {
#   count = 2
#   name = "linuxvm${count.index}"
#   computer_name = "devlinuxvm${count.index}"
#   resource_group_name = azurerm_resource_group.rg01.name
#   location = azurerm_resource_group.rg01.location
#   size = "Standard_DS1_v2"
#   admin_username = "azureuser"
#   network_interface_ids = [element(azurerm_network_interface.nic[*].id, count.index)]
#   admin_ssh_key{
#     username = "azureuser"
#     public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
#   }
#   os_disk {
#     name = "osdisk${count.index}"
#     caching = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   source_image_reference {
#     publisher = "RedHat"
#     offer = "RHEL"
#     sku = "83-gen2"
#     version = "latest"
#   }
#   custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
# }