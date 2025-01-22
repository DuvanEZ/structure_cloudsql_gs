resource "google_sql_database_instance" "this" {
  name             = var.instance_name
  project          = var.project_id
  region           = var.region
  database_version = var.database_version

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = var.public_ip
      private_network = var.private_network
    }
  }
}

resource "google_sql_database" "default_db" {
  name     = var.database_name
  instance = google_sql_database_instance.this.name
  project  = var.project_id

  depends_on = [google_sql_database_instance.this]
}

resource "google_sql_user" "users" {
  name     = var.db_user
  instance = google_sql_database_instance.this.name
  project  = var.project_id
  password = var.db_password

  depends_on = [google_sql_database_instance.this]
}
