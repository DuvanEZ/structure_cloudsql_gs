output "cloud_run_url" {
  description = "URL público de Cloud Run"
  value       = google_cloud_run_service.this.status[0].url
}
