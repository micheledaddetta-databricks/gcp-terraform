output "unity_catalog_metastore_service_account" {
  value = databricks_metastore_data_access.first.databricks_gcp_service_account[*].email
}

output "metastore_id" {
  value = databricks_metastore.this.metastore_id
}

output "catalog_name" {
  value = databricks_catalog.default.name
}