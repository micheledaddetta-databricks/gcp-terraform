
resource "databricks_metastore_assignment" "this" {
  provider = databricks.accounts

  workspace_id = databricks_mws_workspaces.databricks_workspace.workspace_id
  metastore_id = var.metastore_id
}

resource "databricks_workspace_binding" "sandbox" {
  provider       = databricks.workspace
  securable_name = var.default_catalog
  workspace_id   = databricks_mws_workspaces.databricks_workspace.workspace_id
}