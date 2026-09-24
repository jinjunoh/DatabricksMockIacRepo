resource "databricks_dashboard" "tpch_sf1" {
  display_name  = "TPC-H SF1"
  warehouse_id  = databricks_sql_warehouse.reporting.id
  parent_path   = "/Shared/${var.environment}"

  serialized_dashboard = jsonencode({
    pages = [
      {
        name        = "overview"
        displayName = "Overview"
        layout      = []
        widgets     = []
      }
    ]
  })
}

resource "databricks_dashboard" "tpch_sf1_metric_views" {
  display_name  = "TPC-H SF1 Metric Views"
  warehouse_id  = databricks_sql_warehouse.reporting.id
  parent_path   = "/Shared/${var.environment}"

  serialized_dashboard = jsonencode({
    pages = [
      {
        name        = "metrics"
        displayName = "Metrics"
        layout      = []
        widgets     = []
      }
    ]
  })
}

resource "databricks_dashboard" "git_folder_prober" {
  display_name  = "git_folder_prober"
  warehouse_id  = databricks_sql_warehouse.reporting.id
  parent_path   = "/Shared/${var.environment}"

  serialized_dashboard = jsonencode({
    pages = [
      {
        name        = "main"
        displayName = "Main"
        layout      = []
        widgets     = []
      }
    ]
  })
}
