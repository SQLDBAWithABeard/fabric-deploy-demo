# fabricdeploy artifact v1.0.1 | tool 0.1.0 | generated 2026-06-11
# Foundation (core) layer for capacity 'prod' (prod).
# Plain-English summary: ../../../DEPLOYMENT.md  ·  WAF rationale: ../../../AUDIT.md
module "foundation" {
  source               = "../../../modules/foundation"
  resource_group_name  = "Beard-fabric-prod"
  location             = "uksouth"
  tags                 = {}
  enable_log_analytics = false
  log_analytics_name   = "Beard-prod-law"
  retention_days       = 30
}

output "log_analytics_workspace_id" {
  value = module.foundation.log_analytics_workspace_id
}
