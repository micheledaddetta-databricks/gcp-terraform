resource "databricks_mws_workspaces" "databricks_workspace" {

  provider       = databricks.accounts
  account_id     = var.databricks_account_id
  workspace_name = var.workspace_name
  location       = var.google_region
  cloud_resource_container {
    gcp {
      project_id = var.google_project
    }
  }

  private_access_settings_id = databricks_mws_private_access_settings.pas.private_access_settings_id
  network_id                 = databricks_mws_networks.databricks_network.network_id
  gke_config {
    connectivity_type = "PRIVATE_NODE_PUBLIC_MASTER"
    master_ip_range   = var.gke_master_ip_range
  }
  storage_customer_managed_key_id          = databricks_mws_customer_managed_keys.this.customer_managed_key_id
  managed_services_customer_managed_key_id = databricks_mws_customer_managed_keys.this.customer_managed_key_id
}