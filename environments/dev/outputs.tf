output "bucket_name" {
  description = "Nombre del bucket para dev"
  value       = module.storage_dev.bucket_name
}

output "sql_connection_name" {
  description = "Connection name de la instancia dev"
  value       = module.cloud_sql_dev.instance_connection_name
}
