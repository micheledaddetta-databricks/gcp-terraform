
resource "databricks_metastore_assignment" "this" {
  provider = databricks.accounts
  workspace_id = databricks_mws_workspaces.databricks_workspace.workspace_id
  metastore_id = var.metastore_id

  default_catalog_name = "${databricks_mws_workspaces.databricks_workspace.workspace_id}-main"
}