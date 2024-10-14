variable "databricks_account_id" {}
variable "databricks_workspace_url" {}
variable "google_project" {}
variable "google_region" {}

variable "metastore_bucket" {
  default = null
}
variable "unity_catalog_resource_prefix" {
  default = null
}

variable "databricks_workspace_ids" {
  type    = list(string)
  default = []
}