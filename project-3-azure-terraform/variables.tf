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
