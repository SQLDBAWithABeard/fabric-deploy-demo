# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-11
# WAF: Security (data plane) — OneLake security posture for a workspace.
# NOTE: surfaced as variables now; bind to provider resources as OneLake
# security GA arguments stabilise (tracked for a later slice).
variable "workspace_id" { type = string }
variable "enabled" {
  type    = bool
  default = false
}
variable "default_access" {
  type    = string
  default = "restricted"
}

output "onelake_security" {
  value = {
    workspace_id   = var.workspace_id
    enabled        = var.enabled
    default_access = var.default_access
  }
}
