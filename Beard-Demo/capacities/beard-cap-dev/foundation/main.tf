# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12
# Foundation (core) layer for capacity 'beard-cap-dev' (nonprod).
# Plain-English summary: ../../../DEPLOYMENT.md  ·  WAF rationale: ../../../AUDIT.md
module "foundation" {
  source               = "../../../modules/foundation"
  resource_group_name  = "Beard-Demo-fabric-beard-cap-dev"
  location             = "uksouth"
  tags                 = {}
  enable_log_analytics = false
  log_analytics_name   = "Beard-Demo-beard-cap-dev-law"
  retention_days       = 30
}

output "log_analytics_workspace_id" {
  value = module.foundation.log_analytics_workspace_id
}
