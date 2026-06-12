# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.116.0, < 5.0.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = ">= 0.1.0, < 2.0.0"
    }
  }
}

# Authentication is via environment / OIDC / az login — never secrets in code.
provider "azurerm" {
  features {}
}

provider "fabric" {}
