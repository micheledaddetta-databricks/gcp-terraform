resource "databricks_metastore" "this" {
  provider      = databricks.accounts
  name          = "${var.unity_catalog_resource_prefix}-unity-catalog"
  region        = var.google_region
  storage_root  = var.metastore_bucket
  force_destroy = true
}

# CREATE STORAGE CREDENTIALS
resource "databricks_metastore_data_access" "first" {
  provider     = databricks.accounts
  metastore_id = databricks_metastore.this.id
  databricks_gcp_service_account {}
  name       = "${var.unity_catalog_resource_prefix}-uc-storage-credentials" // storage credentials created for the default storage account
  is_default = true
}