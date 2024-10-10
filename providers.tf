terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.52.0"
    }
  }
}

#Requires GOOGLE_CREDENTIALS env variable to be set, otherwise use google_service_account for impersonation
provider "databricks" {
  alias      = "accounts"
  host       = "https://accounts.gcp.databricks.com"
  account_id = var.databricks_account_id
}

#Requires GOOGLE_CREDENTIALS env variable to be set, otherwise use google_service_account for impersonation
provider "databricks" {
  alias      = "workspace"
  host       = module.gcp-workspace-full.workspace_url
  account_id = var.databricks_account_id
}

#Requires GOOGLE_CREDENTIALS env variable to be set, otherwise use impersonate_service_account for impersonation
provider "google" {
  project = var.google_project
  region  = var.google_region
}