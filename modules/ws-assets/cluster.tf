data "databricks_spark_version" "latest" {
  provider = databricks.workspace

  long_term_support = true
  latest            = true
}


resource "databricks_cluster" "all_purpose" {
  provider = databricks.workspace

  cluster_name = "All purpose cluster"

  spark_version           = data.databricks_spark_version.latest.id
  runtime_engine          = "STANDARD" #PHOTON
  node_type_id            = "n2d-highmem-8"
  driver_node_type_id     = "n2d-highmem-8"
  autotermination_minutes = 30
  enable_elastic_disk     = false
  num_workers             = 3

  custom_tags = {}
  spark_conf  = {}

  workload_type {
    clients {
      notebooks = true
    }
  }

  gcp_attributes {
    google_service_account = var.cluster_service_account
    boot_disk_size = 50
    local_ssd_count = 1
  }
}