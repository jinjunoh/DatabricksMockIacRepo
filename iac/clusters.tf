resource "databricks_cluster_policy" "engineering" {
  name = "${var.environment}-engineering-policy"

  definition = jsonencode({
    "autotermination_minutes" = {
      "type"  = "fixed"
      "value" = var.cluster_autotermination_minutes
    }
    "node_type_id" = {
      "type"      = "allowlist"
      "values"    = ["i3.xlarge", "i3.2xlarge", "Standard_DS3_v2", "Standard_DS4_v2"]
      "isOptional" = true
    }
    "spark_version" = {
      "type"      = "regex"
      "pattern"   = "14\\.[0-9]+\\.x-scala.*"
      "isOptional" = true
    }
  })
}

resource "databricks_cluster" "interactive" {
  cluster_name            = "${var.environment}-interactive"
  spark_version           = "14.3.x-scala2.12"
  node_type_id            = "i3.xlarge"
  autotermination_minutes = var.cluster_autotermination_minutes
  policy_id               = databricks_cluster_policy.engineering.id

  autoscale {
    min_workers = 1
    max_workers = 4
  }

  spark_conf = {
    "spark.databricks.delta.preview.enabled" = "true"
    "spark.sql.adaptive.enabled"             = "true"
  }

  custom_tags = local.common_tags
}
