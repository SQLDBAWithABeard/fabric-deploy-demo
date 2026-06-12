# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12
# Platform layer for capacity 'beard-cap-dev' (nonprod).
# Plain-English summary: ../../../DEPLOYMENT.md  ·  WAF rationale: ../../../AUDIT.md
module "networking" {
  source              = "../../../modules/networking"
  public_access       = var.public_access
  private_endpoints   = var.private_endpoints
  managed_vnet        = var.managed_vnet
  ip_firewall         = var.ip_firewall
  outbound_protection = var.outbound_protection
}

module "capacity" {
  source              = "../../../modules/capacity"
  name                = "Beard-Demobeard-cap-devcap"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_members       = var.admin_members
  tags                = var.tags

  surge_protection_enabled           = var.surge_protection_enabled
  surge_protection_reject_percentage = var.surge_protection_reject_percentage
}

module "workspace_dev" {
  source       = "../../../modules/workspace"
  display_name = "Beard-Demo-beard-cap-dev-dev"
  capacity_id  = module.capacity.capacity_id
  roles = {
    Admin       = ["11111-11111-11111-11111"]
    Member      = ["11111-11111-11111-11111"]
    Contributor = ["11111-11111-11111-11111"]
    Viewer      = ["11111-11111-11111-11111"]
  }
}

module "onelake_dev" {
  source         = "../../../modules/onelake_security"
  workspace_id   = module.workspace_dev.workspace_id
  enabled        = true
  default_access = "restricted"
}
module "workspace_test" {
  source       = "../../../modules/workspace"
  display_name = "Beard-Demo-beard-cap-dev-test"
  capacity_id  = module.capacity.capacity_id
  roles = {
    Admin       = ["11111-11111-11111-11111"]
    Member      = ["11111-11111-11111-11111"]
    Contributor = ["11111-11111-11111-11111"]
    Viewer      = ["11111-11111-11111-11111"]
  }
}

module "onelake_test" {
  source         = "../../../modules/onelake_security"
  workspace_id   = module.workspace_test.workspace_id
  enabled        = true
  default_access = "restricted"
}

# Exposed so the content layer can wire workspace_id_dev via
# `terraform output -json` (the cross-state hand-off the deployer + CD use).
output "workspace_id_dev" {
  value = module.workspace_dev.workspace_id
}
# Exposed so the content layer can wire workspace_id_test via
# `terraform output -json` (the cross-state hand-off the deployer + CD use).
output "workspace_id_test" {
  value = module.workspace_test.workspace_id
}
