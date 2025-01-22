output "service_account_email" {
  description = "Correo electrónico de la cuenta de servicio creada"
  value       = google_service_account.this.email
}

output "assigned_roles" {
  description = "Roles asignados a la cuenta de servicio"
  value       = var.roles
}
