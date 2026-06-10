# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-10
# Isolated state per capacity+layer. Configure -backend-config at init time.
terraform {
  backend "azurerm" {
    # key uniquely isolates this root's state.
    key = "dev/platform"
  }
}
