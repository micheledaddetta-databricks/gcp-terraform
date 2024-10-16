resource "databricks_mws_customer_managed_keys" "managed_service" {
  provider = databricks.accounts

  account_id = var.databricks_account_id

  gcp_key_info {
    kms_key_id = var.managed_service_cmek_resource_id
  }

  use_cases = ["MANAGED_SERVICES"]

  /*lifecycle {
    ignore_changes = all
  }*/
}

resource "databricks_mws_customer_managed_keys" "storage" {
  provider = databricks.accounts

  account_id = var.databricks_account_id

  gcp_key_info {
    kms_key_id = var.storage_cmek_resource_id
  }

  use_cases = ["STORAGE"]

  /*lifecycle {
    ignore_changes = all
  }*/
}