# fabricdeploy artifact v1.0.1 | tool 0.1.0 | generated 2026-06-11
# Content layer for capacity 'dev'.
# Plain-English summary: ../../../DEPLOYMENT.md  ·  WAF rationale: ../../../AUDIT.md
module "items_dev" {
  source       = "../../../modules/items"
  workspace_id = var.workspace_id_dev
  lakehouses   = ["lakey-dev"]
  warehouses   = ["warey-dev"]
  notebooks    = ["notey-dev"]
  pipelines    = ["pipey-dev"]
}
module "items_test" {
  source       = "../../../modules/items"
  workspace_id = var.workspace_id_test
  lakehouses   = ["lakey-test"]
  warehouses   = ["warey-test"]
  notebooks    = ["notey-test"]
  pipelines    = ["pipey-test"]
}
