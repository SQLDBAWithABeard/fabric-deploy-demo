# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-10
# WAF: Security (control plane) — workspace + role assignments.
terraform {
  required_providers {
    fabric = {
      source = "microsoft/fabric"
    }
  }
}

variable "display_name" { type = string }
variable "capacity_id" { type = string }
variable "roles" {
  type    = map(list(string)) # role -> list of principal object ids
  default = {}
}

resource "fabric_workspace" "this" {
  display_name = var.display_name
  capacity_id  = var.capacity_id
}

locals {
  role_pairs = flatten([
    for role, principals in var.roles : [
      for pid in principals : { role = role, principal_id = pid }
    ]
  ])
}

resource "fabric_workspace_role_assignment" "this" {
  for_each     = { for p in local.role_pairs : "${p.role}:${p.principal_id}" => p }
  workspace_id = fabric_workspace.this.id
  role         = each.value.role
  principal = {
    id   = each.value.principal_id
    type = "Group"
  }
}

output "workspace_id" {
  value = fabric_workspace.this.id
}
