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
