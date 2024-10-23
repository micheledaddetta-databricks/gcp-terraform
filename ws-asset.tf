module "ws-assets" {
  source = "./modules/ws-assets"

  workspace_url         = module.workspace.workspace_url
  databricks_account_id = var.databricks_account_id

  google_service_account = var.google_service_account
}