variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-devops-portfolio-dev"
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
  default     = "northeurope"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}
variable "virtual_network_name" {
  description = "Name of the Azure virtual network"
  type        = string
  default     = "vnet-devops-portfolio-dev"
}

variable "virtual_network_address_space" {
  description = "Private address space assigned to the virtual network"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the application subnet"
  type        = string
  default     = "snet-application-dev"
}

variable "subnet_address_prefixes" {
  description = "Private address prefixes assigned to the application subnet"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "nsg-application-dev"
}
