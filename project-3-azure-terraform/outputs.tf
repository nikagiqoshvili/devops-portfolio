output "resource_group_name" {
  description = "Name of the created Azure resource group"
  value       = azurerm_resource_group.devops.name
}

output "resource_group_location" {
  description = "Azure region of the resource group"
  value       = azurerm_resource_group.devops.location
}

output "resource_group_id" {
  description = "Azure resource ID of the resource group"
  value       = azurerm_resource_group.devops.id
}
output "virtual_network_name" {
  description = "Name of the Azure virtual network"
  value       = azurerm_virtual_network.devops.name
}

output "virtual_network_address_space" {
  description = "Address space assigned to the Azure virtual network"
  value       = azurerm_virtual_network.devops.address_space
}

output "application_subnet_name" {
  description = "Name of the application subnet"
  value       = azurerm_subnet.application.name
}

output "application_subnet_id" {
  description = "Azure resource ID of the application subnet"
  value       = azurerm_subnet.application.id
}

output "network_security_group_name" {
  description = "Name of the application network security group"
  value       = azurerm_network_security_group.application.name
}

