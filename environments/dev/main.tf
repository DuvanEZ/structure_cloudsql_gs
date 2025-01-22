terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  # Opcional: si usarás un backend remoto (descomenta si aplicas)
  # backend "gcs" {
  #   bucket = "mi-terraform-state-bucket"
  #   prefix = "dev"
  # }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  # credentials = file("path/to/service_account.json")  # si lo necesitas
}

# ---------------------------------------------------------------------------
# Módulo: Cloud Storage
# ---------------------------------------------------------------------------
module "storage_dev" {
  source = "../../modules/storage-bucket"

  # Nombre del bucket: "glob-gs-csv"
  bucket_name                    = "glob-gs-csv"
  location                       = var.bucket_location      # Podrías cambiar var.bucket_location a us-east1
  storage_class                  = var.storage_class
  uniform_bucket_level_access    = true
  versioning                     = false
  labels = {
    environment = "dev"
    team        = "my-team"
  }
}

# ---------------------------------------------------------------------------
# Módulo: Cloud Run
# ---------------------------------------------------------------------------
module "cloud_run_dev" {
  source          = "../../modules/cloud-run"
  project_id      = var.project_id
  service_name    = "my-cloud-run-service-dev"
  location        = var.region
  image           = var.image
  environment_tag = "dev"

  run_invoker_member = "allUsers"
  service_account    = var.cloud_run_sa
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
  db_user           = "dev_user"
  db_password       = var.db_password
}
