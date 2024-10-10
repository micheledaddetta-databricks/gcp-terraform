###### GENERIC VARIABLES

variable "databricks_account_id" {}
variable "google_region" {}
variable "google_project" {}
variable "workspace_name" {}


###### CMEK VARIABLES

variable "cmek_resource_id" {}


###### NETWORK VARIABLES

variable "google_vpc_project" {}
variable "google_vpc_id" {}
variable "google_subnet_id" {}
variable "pod_subnet_name" {}
variable "service_subnet_name" {}
variable "gke_master_ip_range" {}


###### PSC VARIABLES

variable "workspace_pe_name" {}
variable "relay_pe_name" {}