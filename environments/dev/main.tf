terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }


}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  # credentials = file("path/to/service_account.json")  
}

# ---------------------------------------------------------------------------
# Módulo: Cloud Storage
# ---------------------------------------------------------------------------
module "storage_dev" {
  source = "../../modules/storage-bucket"

  # Nombre del bucket: "glob-gs-csv"
  bucket_name                    = "glob-gs-csv"
  location                       = var.bucket_location      
  storage_class                  = var.storage_class
  uniform_bucket_level_access    = true
  versioning                     = false
  labels = {
    environment = "dev"
    team        = "my-team"
  }
}


# ---------------------------------------------------------------------------
# Módulo: Cloud SQL
# ---------------------------------------------------------------------------
module "cloud_sql_dev" {
  source            = "../../modules/cloud-sql"
  project_id        = var.project_id
  instance_name     = "my-cloud-sql-dev"
  region            = var.region
  database_version  = "POSTGRES_13"
  tier              = "db-f1-micro"
  public_ip         = true
  private_network   = null
  database_name     = "dev_db"
  db_user           = "dzmonsalve"
  db_password       =  data.google_secret_manager_secret_version.db_password.secret_data
}

# ---------------------------------------------------------------------------
# Módulo: IAM
# ---------------------------------------------------------------------------

module "iam_service_account" {
  source = "../../modules/iam"

  project_id                    = var.project_id
  service_account_id            = "terraform-sa"
  service_account_display_name  = "Terraform Service Account"
  roles = [
    "roles/cloudsql.client",       # Acceso a Cloud SQL
    "roles/cloudsql.editor",       # Permisos para manipular datos
    "roles/storage.admin",         # Acceso total a Cloud Storage
    "roles/run.admin",             # Permisos para Cloud Run
    "roles/iam.serviceAccountUser" # Permite que otros usen esta cuenta
  ]
}
