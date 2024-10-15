variable "databricks_account_id" {}
variable "google_project" {}
variable "google_region" {}

variable "metastore_bucket" {
  default = null
}
variable "unity_catalog_resource_prefix" {
  default = null
}

variable "google_service_account" {
}