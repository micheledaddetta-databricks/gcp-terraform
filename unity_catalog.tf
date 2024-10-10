module "unity_catalog" {
  source = "./modules/unity-catalog"

  databricks_account_id         = var.databricks_account_id
  databricks_workspace_url      = module.workspace.workspace_url
  google_project                = var.google_project
  google_region                 = var.google_region
  metastore_bucket              = var.metastore_bucket
  unity_catalog_resource_prefix = var.unity_catalog_resource_prefix
}