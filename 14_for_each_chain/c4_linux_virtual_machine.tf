# Resource: Azure Linux Virtual Machine

resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  #count = 2
  #for_each = toset(["vm1", "vm2"])  
  for_each = azurerm_network_interface.nic #for_each chaining
  # Define Explicit Dependency that if VM Nic exists, then only create VM
  depends_on = [ azurerm_network_interface.nic]
  name                = "mylinuxvm-${each.key}"
  computer_name       = "devlinux-${each.key}" # Hostname of the VM
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = "Standard_DS1_v2"
  admin_username      = "azureuser"
  #network_interface_ids = [element(azurerm_network_interface.nic.*.id, each.key)]
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name = "osdisk${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    #disk_size_gb = 20
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}