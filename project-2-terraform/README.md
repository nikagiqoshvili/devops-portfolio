# Terraform Fundamentals

This project demonstrates the basic Terraform workflow using the local
provider. Terraform creates and manages a local text file without requiring
a cloud account.

## Architecture

```text
Terraform configuration
        |
        v
HashiCorp local provider
        |
        v
Managed local file
