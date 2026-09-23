resource "databricks_job" "etl_pipeline" {
  name = "${var.environment}-etl-pipeline"

  job_cluster {
    job_cluster_key = "etl_cluster"

    new_cluster {
      spark_version           = "14.3.x-scala2.12"
      node_type_id            = "i3.xlarge"
      autotermination_minutes = 30
      num_workers             = 2

      spark_conf = {
        "spark.sql.adaptive.enabled" = "true"
      }

      custom_tags = local.common_tags
    }
  }

  task {
    task_key = "ingest"

    notebook_task {
      notebook_path = databricks_notebook.ingest.path
      base_parameters = {
        "env"         = var.environment
        "source_path" = "/mnt/raw/events"
      }
    }

    job_cluster_key = "etl_cluster"
  }

  task {
    task_key = "transform"

    depends_on {
      task_key = "ingest"
    }

    spark_python_task {
      python_file = "/Repos/data-engineering/transforms/run_transforms.py"
      parameters  = ["--env", var.environment]
    }

    job_cluster_key = "etl_cluster"
  }

  schedule {
    quartz_cron_expression = "0 0 6 * * ?"
    timezone_id            = "America/Los_Angeles"
    pause_status           = var.environment == "prod" ? "UNPAUSED" : "PAUSED"
  }

  email_notifications {
    on_failure = ["data-engineering@example.com"]
  }

  tags = local.common_tags
}
