output "bucket_name" {
  description = "Nombre final del bucket"
  value       = google_storage_bucket.this.name
}
