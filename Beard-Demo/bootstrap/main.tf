# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12
# Optional: creates the versioned, locked storage backing all capacity state.
# Run this FIRST, then configure each root's backend.tf to point at it.
variable "resource_group_name" {
  type    = string
  default = "Beard-Demo-fabric-tfstate"
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "account_name" { type = string }

resource "azurerm_resource_group" "state" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "state" {
  name                     = var.account_name
  resource_group_name      = azurerm_resource_group.state.name
  location                 = azurerm_resource_group.state.location
  account_tier             = "Standard"
  account_replication_type = "GRS"    # WAF Reliability: geo-redundant state
  min_tls_version          = "TLS1_2" # WAF Security
  blob_properties {
    versioning_enabled = true # WAF Operational Excellence: state history
  }
}

resource "azurerm_storage_container" "state" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.state.name
  container_access_type = "private"
}
