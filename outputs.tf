output "workspace_url" {
  value = module.workspace.workspace_url
}
output "workspace_id" {
  value = module.workspace.workspace_id
}

output "workspace_name" {
  value = var.workspace_name
}

output "unity_catalog_metastore_service_account" {
  value = module.unity_catalog.unity_catalog_metastore_service_account
}