# fabricdeploy artifact v1.0.1 | tool 0.1.0 | generated 2026-06-11
# WAF: Security (network plane) — public/private posture for a capacity.
variable "public_access" { type = bool }
variable "private_endpoints" { type = bool }
variable "managed_vnet" {
  type    = bool
  default = false
}
variable "ip_firewall" {
  type    = bool
  default = false
}
variable "outbound_protection" {
  type    = bool
  default = false
}

# Concrete private-endpoint / managed-VNet / IP-firewall resources are added in a
# later networking slice; the posture is enforced and surfaced here so downstream
# consumers can branch on it.
output "network_posture" {
  value = {
    public_access       = var.public_access
    private_endpoints   = var.private_endpoints
    managed_vnet        = var.managed_vnet
    ip_firewall         = var.ip_firewall
    outbound_protection = var.outbound_protection
  }
}
