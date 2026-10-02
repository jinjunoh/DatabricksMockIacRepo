# Governed tag assignments for the tables managed in tables.tf.
#
# Remediation for the "untagged tables" governance recommendation: these
# databricks_sql_table resources support no `tags` argument, so Unity Catalog
# governed tags are assigned with the databricks_entity_tag_assignment
# resource instead.
#
# Keys and values match governed tag policies defined in the account:
#   data_domain         -> sales, finance, marketing, engineering, operations, other
#   data_classification -> public, internal, confidential, restricted, unreviewed

locals {
  tpcds_tables = [
    "date_dim",
    "store_sales",
    "catalog_sales",
    "store",
    "web_sales",
    "item",
    "customer_address",
    "customer",
  ]
}

resource "databricks_entity_tag_assignment" "tpcds_data_domain" {
  for_each = toset(local.tpcds_tables)

  entity_type = "tables"
  entity_name = "${var.catalog_name}.${var.schema_name}.${each.value}"
  tag_key     = "data_domain"
  tag_value   = "sales"
}

resource "databricks_entity_tag_assignment" "tpcds_data_classification" {
  for_each = toset(local.tpcds_tables)

  entity_type = "tables"
  entity_name = "${var.catalog_name}.${var.schema_name}.${each.value}"
  tag_key     = "data_classification"
  tag_value   = "internal"
}
