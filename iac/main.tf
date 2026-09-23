provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}

locals {
  common_tags = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "databricks-mock-iac"
  }
}
