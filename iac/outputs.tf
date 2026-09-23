output "cluster_id" {
  description = "ID of the interactive all-purpose cluster"
  value       = databricks_cluster.interactive.id
}

output "cluster_policy_id" {
  description = "ID of the engineering cluster policy"
  value       = databricks_cluster_policy.engineering.id
}

output "job_id" {
  description = "ID of the ETL pipeline job"
  value       = databricks_job.etl_pipeline.id
}

output "sql_warehouse_id" {
  description = "ID of the reporting SQL warehouse"
  value       = databricks_sql_warehouse.reporting.id
}

output "notebook_ingest_path" {
  description = "Workspace path of the ingest notebook"
  value       = databricks_notebook.ingest.path
}

output "notebook_transform_path" {
  description = "Workspace path of the transform notebook"
  value       = databricks_notebook.transform.path
}

output "secret_scope_name" {
  description = "Name of the app secret scope"
  value       = databricks_secret_scope.app.name
}
