terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.61.0"
    }
  }
}

#Requires GOOGLE_CREDENTIALS env variable to be set, otherwise use google_service_account for impersonation
provider "databricks" {
  alias                  = "accounts"
  host                   = "https://accounts.gcp.databricks.com"
  account_id             = var.databricks_account_id
  google_service_account = var.google_service_account
}

#Requires GOOGLE_CREDENTIALS env variable to be set, otherwise use google_service_account for impersonation
provider "databricks" {
  alias                  = "workspace"
  host                   = module.workspace.workspace_url
  account_id             = var.databricks_account_id
  google_service_account = var.google_service_account
}