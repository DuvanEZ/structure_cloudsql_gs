output "bucket_name" {
  description = "Nombre del bucket para dev"
  value       = module.storage_dev.bucket_name
}

output "cloud_run_url" {
  description = "URL de Cloud Run dev"
  value       = module.cloud_run_dev.cloud_run_url
}

output "sql_connection_name" {
  description = "Connection name de la instancia dev"
  value       = module.cloud_sql_dev.instance_connection_name
}
