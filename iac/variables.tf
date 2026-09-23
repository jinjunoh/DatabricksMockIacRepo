variable "databricks_host" {
  description = "Databricks workspace URL (e.g. https://adb-1234567890.1.azuredatabricks.net)"
  type        = string
}

variable "databricks_token" {
  description = "Databricks personal access token"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod"
  }
}

variable "cluster_autotermination_minutes" {
  description = "Minutes of inactivity before an interactive cluster is terminated"
  type        = number
  default     = 60
}
