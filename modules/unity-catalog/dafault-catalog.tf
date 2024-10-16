resource "databricks_catalog" "default" {
  provider     = databricks.accounts
  storage_root = var.metastore_bucket
  name         = "main"
  comment      = "This catalog is managed by terraform"
  properties = {
    purpose = "poc"
  }
  depends_on = [databricks_metastore_data_access.first]
}