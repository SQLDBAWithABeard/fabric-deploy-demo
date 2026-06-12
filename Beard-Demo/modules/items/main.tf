# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-11
# WAF: content items deployed into a workspace.
terraform {
  required_providers {
    fabric = {
      source = "microsoft/fabric"
    }
  }
}

variable "workspace_id" { type = string }
variable "lakehouses" {
  type    = list(string)
  default = []
}
variable "warehouses" {
  type    = list(string)
  default = []
}
variable "notebooks" {
  type    = list(string)
  default = []
}
variable "pipelines" {
  type    = list(string)
  default = []
}

resource "fabric_lakehouse" "this" {
  for_each     = toset(var.lakehouses)
  display_name = each.value
  workspace_id = var.workspace_id
}

resource "fabric_warehouse" "this" {
  for_each     = toset(var.warehouses)
  display_name = each.value
  workspace_id = var.workspace_id
}

resource "fabric_notebook" "this" {
  for_each     = toset(var.notebooks)
  display_name = each.value
  workspace_id = var.workspace_id
}

resource "fabric_data_pipeline" "this" {
  for_each     = toset(var.pipelines)
  display_name = each.value
  workspace_id = var.workspace_id
}
