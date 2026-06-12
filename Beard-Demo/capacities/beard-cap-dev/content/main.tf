# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12
# Content layer for capacity 'beard-cap-dev'.
# Plain-English summary: ../../../DEPLOYMENT.md  ·  WAF rationale: ../../../AUDIT.md
module "items_dev" {
  source       = "../../../modules/items"
  workspace_id = var.workspace_id_dev
  lakehouses   = ["lakey"]
  warehouses   = ["warey"]
  notebooks    = ["notey"]
  pipelines    = ["pipey"]
}
module "items_test" {
  source       = "../../../modules/items"
  workspace_id = var.workspace_id_test
  lakehouses   = ["lakey"]
  warehouses   = ["warey"]
  notebooks    = ["notey"]
  pipelines    = ["pipey"]
}
