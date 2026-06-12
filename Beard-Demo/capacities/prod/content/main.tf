# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-11
# Content layer for capacity 'prod'.
# Plain-English summary: ../../../DEPLOYMENT.md  ·  WAF rationale: ../../../AUDIT.md
module "items_prod" {
  source       = "../../../modules/items"
  workspace_id = var.workspace_id_prod
  lakehouses   = ["lakey"]
  warehouses   = ["warey"]
  notebooks    = ["notey"]
  pipelines    = ["pipey"]
}
