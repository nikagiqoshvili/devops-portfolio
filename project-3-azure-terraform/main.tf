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
