terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    storage_account_name = "sttfstate42f82fd7"
    container_name       = "tfstate"
    key                  = "project-3-azure-terraform.tfstate"
  }


}
