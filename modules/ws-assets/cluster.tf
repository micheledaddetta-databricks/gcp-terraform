data "databricks_spark_version" "latest" {
  provider = databricks.workspace

  long_term_support = true
  latest            = true
}


resource "databricks_cluster" "all_purpose" {
  provider = databricks.workspace

  cluster_name = "Job cluster"

  spark_version           = data.databricks_spark_version.latest.id
  runtime_engine          = "STANDARD" #PHOTON
  node_type_id            = "n2d-highmem-8"
  driver_node_type_id     = "n2d-highmem-8"
  autotermination_minutes = 30
  enable_elastic_disk     = false
  num_workers             = 3

  data_security_mode = "USER_ISOLATION"
  single_user_name   = var.cluster_user_name

  custom_tags = []
  spark_conf  = {}

  workload_type {
    notebooks = true
  }
}