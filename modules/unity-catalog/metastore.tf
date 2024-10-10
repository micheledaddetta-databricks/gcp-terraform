resource "databricks_metastore" "this" {
  provider      = databricks.accounts
  name          = "${var.unity_catalog_resource_prefix}-unity-catalog"
  region        = var.google_region
  storage_root  = var.metastore_bucket
  force_destroy = true
}

resource "databricks_metastore_assignment" "this" {
  provider = databricks.workspace
  for_each    = toset(var.databricks_workspace_ids)

  workspace_id = each.value
  metastore_id = databricks_metastore.this.id

  default_catalog_name = "${each.value}-main"
}

# CREATE STORAGE CREDENTIALS
resource "databricks_metastore_data_access" "first" {
  provider     = databricks.accounts
  metastore_id = databricks_metastore.this.id
  databricks_gcp_service_account {}
  name       = "${var.unity_catalog_resource_prefix}-uc-storage-credentials" // storage credentials created for the default storage account
  is_default = true
}