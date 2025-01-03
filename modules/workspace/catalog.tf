data "google_storage_bucket" "catalog" {
  name = var.default_catalog_bucket
}

resource "databricks_metastore_assignment" "this" {
  provider = databricks.accounts

  workspace_id = databricks_mws_workspaces.databricks_workspace.workspace_id
  metastore_id = var.metastore_id

  default_catalog_name = "hive_metastore"
}

resource "google_storage_bucket_iam_member" "unity_sa_admin" {
  count = var.default_catalog_bucket != null ? 1 : 0

  bucket = data.google_storage_bucket.catalog.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${databricks_storage_credential.ext[0].databricks_gcp_service_account[0].email}"
}

resource "google_storage_bucket_iam_member" "unity_sa_reader" {
  count = var.default_catalog_bucket != null ? 1 : 0

  bucket = data.google_storage_bucket.catalog.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:${databricks_storage_credential.ext[0].databricks_gcp_service_account[0].email}"
}

resource "databricks_storage_credential" "ext" {
  provider = databricks.workspace

  count = var.default_catalog_bucket != null ? 1 : 0

  name = "${var.workspace_name}-credentials"
  databricks_gcp_service_account {}
  depends_on = [databricks_metastore_assignment.this]
}

resource "databricks_external_location" "some" {
  provider = databricks.workspace

  depends_on = [google_storage_bucket_iam_member.unity_sa_admin, google_storage_bucket_iam_member.unity_sa_reader]
  count      = var.default_catalog_bucket != null ? 1 : 0

  name = "${var.workspace_name}-external-location"
  url  = data.google_storage_bucket.catalog.url

  credential_name = databricks_storage_credential.ext[0].id
}

resource "databricks_catalog" "default" {
  provider   = databricks.workspace
  depends_on = [databricks_metastore_assignment.this, databricks_external_location.some]
  count      = var.default_catalog_bucket != null ? 1 : 0

  name         = "main"
  comment      = "This catalog is managed by terraform"
  storage_root = data.google_storage_bucket.catalog.url

  properties = {
    purpose = "poc"
  }

}

resource "databricks_grants" "sandbox" {
  provider = databricks.workspace

  catalog = databricks_catalog.default[0].name
  grant {
    principal  = var.default_catalog_owner
    privileges = ["USE_CATALOG", "CREATE_SCHEMA"]
  }
}
