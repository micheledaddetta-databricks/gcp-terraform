
resource "databricks_metastore_assignment" "this" {
  provider = databricks.accounts

  workspace_id = databricks_mws_workspaces.databricks_workspace.workspace_id
  metastore_id = var.metastore_id
}

resource "databricks_catalog" "default" {
  provider = databricks.accounts
  count    = var.default_catalog_bucket != null ? 1 : 0

  name           = "${var.workspace_name}-main"
  comment        = "This catalog is managed by terraform"
  storage_root   = var.default_catalog_bucket
  isolation_mode = "ISOLATED"

  properties = {
    purpose = "poc"
  }

  depends_on = [databricks_metastore_assignment.this]
}
