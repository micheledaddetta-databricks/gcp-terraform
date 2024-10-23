module "unity_catalog" {
  source = "./modules/unity-catalog"

  databricks_account_id = var.databricks_account_id
  google_project        = var.google_project
  google_region         = var.google_region

  unity_catalog_resource_prefix = var.unity_catalog_resource_prefix

  google_service_account = var.google_service_account
}