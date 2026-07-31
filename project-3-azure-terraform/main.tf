resource "azurerm_resource_group" "devops" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    project     = "devops-portfolio"
    managed_by  = "terraform"
    owner       = "nika"
  }
}
resource "azurerm_virtual_network" "devops" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = azurerm_resource_group.devops.location
  resource_group_name = azurerm_resource_group.devops.name

  tags = azurerm_resource_group.devops.tags
}
resource "azurerm_subnet" "application" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.devops.name
  virtual_network_name = azurerm_virtual_network.devops.name
  address_prefixes     = var.subnet_address_prefixes
}
resource "azurerm_network_security_group" "application" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.devops.location
  resource_group_name = azurerm_resource_group.devops.name

  tags = azurerm_resource_group.devops.tags
}
resource "azurerm_subnet_network_security_group_association" "application" {
  subnet_id                 = azurerm_subnet.application.id
  network_security_group_id = azurerm_network_security_group.application.id
}
resource "azurerm_network_security_rule" "ssh" {
  name                        = "Allow-SSH-From-Home"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.allowed_ssh_source
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.devops.name
  network_security_group_name = azurerm_network_security_group.application.name
}
resource "azurerm_network_security_rule" "http" {
  name                        = "Allow-HTTP"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.devops.name
  network_security_group_name = azurerm_network_security_group.application.name
}
resource "azurerm_public_ip" "vm" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.devops.location
  resource_group_name = azurerm_resource_group.devops.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = azurerm_resource_group.devops.tags
}
resource "azurerm_network_interface" "vm" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.devops.location
  resource_group_name = azurerm_resource_group.devops.name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.application.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }

  tags = azurerm_resource_group.devops.tags
}
