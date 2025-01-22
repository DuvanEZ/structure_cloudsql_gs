resource "google_cloud_run_service" "this" {
  name     = var.service_name
  location = var.location

  template {
    spec {
      containers {
        image = var.image
        env {
          name  = "ENVIRONMENT"
          value = var.environment_tag
        }
      }
      service_account_name = var.service_account
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.this.name
  location = google_cloud_run_service.this.location
  project  = var.project_id
  role     = "roles/run.invoker"
  member   = var.run_invoker_member

  depends_on = [google_cloud_run_service.this]
}
