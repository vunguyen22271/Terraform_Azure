# Resource_2: Virtual Network
resource "azurerm_virtual_network" "vnet01" {
  name = "vnet01"
  address_space = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  tags = {
    environment = "Dev"
  }
}

# Resource_3: Subnet
resource "azurerm_subnet" "subnet01" {
  name = "subnet01"
  resource_group_name = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes = ["10.0.1.0/24"]
}

# Resource_4: Public IP Adress
resource "azurerm_public_ip" "publicip01" {
  name = "publicip01"
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  allocation_method = "Static"
  domain_name_label = "app1-vm-${random_string.randomstring01.id}"
  tags = {
    environment = "Dev"
  }
}

# Resource_5: Network Interface Card
resource "azurerm_network_interface" "nic01" {
  # Add Explicit Dependency to have this resource created only after Virtual Network and Subnet Resources are created. 
  depends_on = [
    azurerm_subnet.subnet01,
    azurerm_public_ip.publicip01
  ]
  name = "nic01"
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  ip_configuration {
    name                          = "ipconfig01"
    subnet_id = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
    public_ip_address_id = azurerm_public_ip.publicip01.id
  }
}

# Resource_6: Network Security Group
resource "azurerm_network_security_group" "nsg01" {
  name                = "nsg01"
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "http"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Prometheus"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9090"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Grafana"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Node_Exporter"
    priority                   = 1005
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9100"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Resource_7: Associate Network Interface and Network Security Group
resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.nic01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}
