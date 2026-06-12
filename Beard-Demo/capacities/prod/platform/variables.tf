# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-11
variable "sku" {
  type = string
}
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
variable "resource_group_name" {
  type    = string
  default = "Beard-fabric-prod"
}
variable "location" {
  type    = string
  default = "uksouth"
}
variable "admin_members" {
  type    = list(string)
  default = ["f1f0057c-53d4-4a73-961a-c3f4501cbce1"]
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "surge_protection_enabled" {
  type    = bool
  default = true
}
variable "surge_protection_reject_percentage" {
  type    = number
  default = 80
}
