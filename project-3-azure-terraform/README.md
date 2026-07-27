# Azure Resource Group with Terraform

This project creates an Azure resource group using Terraform and the
AzureRM provider.

## Architecture

```text
Local Terraform configuration
            |
            v
AzureRM provider
            |
            v
Azure subscription
            |
            v
Resource group
