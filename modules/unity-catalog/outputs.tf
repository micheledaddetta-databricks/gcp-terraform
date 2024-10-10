output "unity_catalog_metastore_service_account" {
  value = databricks_metastore_data_access.first.databricks_gcp_service_account[*].email
}