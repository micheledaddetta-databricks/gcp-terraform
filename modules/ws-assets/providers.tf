terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.53.0"
    }
  }
}

#Requires GOOGLE_CREDENTIALS env variable to be set, otherwise use google_service_account for impersonation
provider "databricks" {
  alias                  = "workspace"
  host                   = var.workspace_url
  account_id             = var.databricks_account_id
  google_service_account = var.google_service_account
}