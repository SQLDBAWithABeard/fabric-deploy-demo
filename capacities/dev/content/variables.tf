# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-10
# Content layer references the workspace ids produced by the platform layer.
# Provide these via terraform_remote_state or -var at apply time.
variable "workspace_id_dev" { type = string }
variable "workspace_id_test" { type = string }
