module "workspace" {
  source = "./modules/workspace"


  workspace_name        = var.workspace_name
  databricks_account_id = var.databricks_account_id
  google_project        = var.google_project
  google_region         = var.google_region

  workspace_admins = var.workspace_admins

  managed_service_cmek_resource_id = var.managed_service_cmek_resource_id
  storage_cmek_resource_id         = var.storage_cmek_resource_id

  google_vpc_project  = var.google_vpc_project
  google_vpc_id       = var.google_vpc_id
  google_subnet_id    = var.google_subnet_id
  pod_subnet_name     = var.pod_subnet_name
  service_subnet_name = var.service_subnet_name
  gke_master_ip_range = var.gke_master_ip_range

  relay_pe_name     = var.relay_pe_name
  workspace_pe_name = var.workspace_pe_name

  metastore_id           = module.unity_catalog.metastore_id
  default_catalog_bucket = var.default_catalog_bucket
  default_catalog_owner  = var.default_catalog_owner

  google_service_account = var.google_service_account
}