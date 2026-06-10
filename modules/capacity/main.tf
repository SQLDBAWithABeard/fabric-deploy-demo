# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-10
# WAF: Cost + Reliability — the billable Fabric capacity (Azure-side resource).
variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "sku" { type = string }
variable "admin_members" { type = list(string) }
variable "tags" {
  type    = map(string)
  default = {}
}
variable "surge_protection_enabled" {
  type    = bool
  default = false
}
variable "surge_protection_reject_percentage" {
  type    = number
  default = 100
}

resource "azurerm_fabric_capacity" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administration_members = var.admin_members
  sku {
    name = var.sku
    tier = "Fabric"
  }
  tags = var.tags
}

output "capacity_id" {
  value = azurerm_fabric_capacity.this.id
}

# WAF REL-SCL-001 — surge protection. Surfaced natively for the deployer/auditor.
# The azurerm/microsoft/fabric providers do not expose a native capacity
# surge-protection attribute; we surface the resolved values rather than reach for
# azapi (a documented gap is preferred). Wire onto azurerm_fabric_capacity.this
# here if a provider version adds the attribute. See DEPLOYMENT.md / AUDIT.md.
output "surge_protection" {
  value = {
    enabled           = var.surge_protection_enabled
    reject_percentage = var.surge_protection_reject_percentage
  }
}
