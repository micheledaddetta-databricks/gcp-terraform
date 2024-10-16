resource "databricks_mws_networks" "databricks_network" {
  provider   = databricks.accounts
  account_id = var.databricks_account_id


  network_name = "${var.workspace_name}-network"

  gcp_network_info {
    network_project_id    = var.google_vpc_project
    vpc_id                = var.google_vpc_id
    subnet_id             = var.google_subnet_id
    subnet_region         = var.google_region
    pod_ip_range_name     = var.pod_subnet_name
    service_ip_range_name = var.service_subnet_name
  }

  vpc_endpoints {
    dataplane_relay = [databricks_mws_vpc_endpoint.relay_vpce.vpc_endpoint_id]
    rest_api        = [databricks_mws_vpc_endpoint.workspace_vpce.vpc_endpoint_id]
  }
}