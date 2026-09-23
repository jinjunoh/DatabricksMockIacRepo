resource "databricks_sql_warehouse" "reporting" {
  name             = "${var.environment}-reporting"
  cluster_size     = "Small"
  max_num_clusters = 1
  auto_stop_mins   = 30
  warehouse_type   = "PRO"

  channel {
    name = "CHANNEL_NAME_CURRENT"
  }

  tags {
    dynamic "custom_tags" {
      for_each = local.common_tags
      content {
        key   = custom_tags.key
        value = custom_tags.value
      }
    }
  }
}
