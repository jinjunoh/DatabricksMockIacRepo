resource "databricks_secret_scope" "app" {
  name = "${var.environment}-app-secrets"
}

resource "databricks_secret" "db_password" {
  key          = "db-password"
  string_value = "change-me-before-use"
  scope        = databricks_secret_scope.app.id
}

resource "databricks_secret_acl" "data_engineers_read" {
  scope      = databricks_secret_scope.app.id
  principal  = databricks_group.data_engineers.display_name
  permission = "READ"
}
