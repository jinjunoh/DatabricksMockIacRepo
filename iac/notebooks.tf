resource "databricks_notebook" "ingest" {
  path     = "/Shared/${var.environment}/ingest"
  language = "PYTHON"

  # Simple ingestion notebook — reads raw events, writes to Delta
  content_base64 = base64encode(<<-PYTHON
    # Databricks notebook: ingest
    # Managed by Terraform — do not edit manually

    dbutils.widgets.text("env", "dev")
    dbutils.widgets.text("source_path", "/mnt/raw/events")

    env         = dbutils.widgets.get("env")
    source_path = dbutils.widgets.get("source_path")

    df = (
        spark.read.format("json")
        .option("inferSchema", "true")
        .load(source_path)
    )

    (
        df.write.format("delta")
        .mode("append")
        .option("mergeSchema", "true")
        .saveAsTable(f"{env}.bronze.events")
    )

    print(f"Ingested {df.count()} records into {env}.bronze.events")
  PYTHON
  )
}

resource "databricks_notebook" "transform" {
  path     = "/Shared/${var.environment}/transform"
  language = "PYTHON"

  content_base64 = base64encode(<<-PYTHON
    # Databricks notebook: transform
    # Managed by Terraform — do not edit manually

    dbutils.widgets.text("env", "dev")

    env = dbutils.widgets.get("env")

    bronze = spark.read.table(f"{env}.bronze.events")

    silver = (
        bronze
        .dropDuplicates(["event_id"])
        .filter("event_type IS NOT NULL")
    )

    (
        silver.write.format("delta")
        .mode("overwrite")
        .option("overwriteSchema", "true")
        .saveAsTable(f"{env}.silver.events")
    )

    print(f"Transformed {silver.count()} records into {env}.silver.events")
  PYTHON
  )
}
