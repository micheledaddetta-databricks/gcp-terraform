resource "databricks_mws_permission_assignment" "add_admin_users" {
  provider = databricks.accounts
  for_each = toset(var.workspace_admins)

  workspace_id = databricks_mws_workspaces.databricks_workspace.workspace_id
  principal_id = data.databricks_user.admin_users[each.value].id
  permissions  = ["ADMIN"]
}

data "databricks_user" "admin_users" {
  provider = databricks.accounts
  for_each = toset(var.workspace_admins)

  user_name = each.value
}