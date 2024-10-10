variable "workspace_name" {
  description = "Name to assign to workspace and related resources"
}
variable "databricks_account_id" {
  description = "Databricks Account ID"
}

variable "google_project" {
  description = "Google Cloud project ID"
}

variable "google_region" {
  description = "Google Cloud region to use"
}

variable "cmek_resource_id" {
  description = "Google Cloud Customer Managed Encryption Key ID"
}


variable "google_vpc_project" {
  description = "Google Cloud project ID where the VPC resides (host project in case of Shared VPC)"
}

variable "google_vpc_id" {
  description = "ID of Google VPC"
}

variable "google_subnet_id" {
  description = "ID of Google VPC subnet"
}

variable "pod_subnet_name" {
  description = "Name used for the pod secondary range"
}

variable "service_subnet_name" {
  description = "Name used for the service secondary range"
}

variable "gke_master_ip_range" {
  description = "IP range assigned to GKE master nodes"
}

variable "workspace_pe_name" {
  description = "Google Cloud PSC endpoint name for front-end communication"
}
variable "relay_pe_name" {
  description = "Google Cloud PSC endpoint name for back-end communication"
}