output "instance_connection_name" {
  description = "Connection Name de la instancia (PROJECT:REGION:INSTANCE)"
  value       = google_sql_database_instance.this.connection_name
}

output "public_ip_address" {
  description = "IP pública de la instancia (si está habilitada)"
  value       = google_sql_database_instance.this.public_ip_address
}
