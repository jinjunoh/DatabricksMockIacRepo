resource "databricks_group" "data_engineers" {
  display_name = "data-engineers"
}

resource "databricks_user" "alice" {
  user_name    = "alice@example.com"
  display_name = "Alice Example"
}

resource "databricks_user" "bob" {
  user_name    = "bob@example.com"
  display_name = "Bob Example"
}

resource "databricks_group_member" "alice" {
  group_id  = databricks_group.data_engineers.id
  member_id = databricks_user.alice.id
}

resource "databricks_group_member" "bob" {
  group_id  = databricks_group.data_engineers.id
  member_id = databricks_user.bob.id
}

resource "databricks_permissions" "cluster" {
  cluster_id = databricks_cluster.interactive.id

  access_control {
    group_name       = databricks_group.data_engineers.display_name
    permission_level = "CAN_RESTART"
  }
}

resource "databricks_permissions" "sql_warehouse" {
  sql_warehouse_id = databricks_sql_warehouse.reporting.id

  access_control {
    group_name       = databricks_group.data_engineers.display_name
    permission_level = "CAN_USE"
  }
}
