# Resource: Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "linuxvm01" {
  name = "linuxvm01"
  computer_name = "devlinuxvm01"
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.nic01.id
  ]
  admin_ssh_key{
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}