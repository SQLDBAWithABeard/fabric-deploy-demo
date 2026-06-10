# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-10
# WAF: Operational Excellence + Security — core layer: resource group, Log Analytics, tags.
# Sources: OPS-MON-001 (Monitor your environment), SEC-IDN-004 (export audit logs).
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
variable "enable_log_analytics" {
  type    = bool
  default = false
}
variable "log_analytics_name" {
  type    = string
  default = ""
}
variable "retention_days" {
  type    = number
  default = 30
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "this" {
  count               = var.enable_log_analytics ? 1 : 0
  name                = var.log_analytics_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_days
  tags                = var.tags
}

output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "log_analytics_workspace_id" {
  value = var.enable_log_analytics ? azurerm_log_analytics_workspace.this[0].id : null
}
