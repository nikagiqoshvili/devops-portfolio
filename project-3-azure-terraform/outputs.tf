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
