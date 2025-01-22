variable "project_id" {
  type        = string
  description = "ID del proyecto de GCP"
}

variable "service_account_id" {
  type        = string
  description = "ID único para la cuenta de servicio"
}

variable "service_account_display_name" {
  type        = string
  description = "Nombre descriptivo de la cuenta de servicio"
}

variable "roles" {
  type        = list(string)
  description = "Lista de roles que se asignarán a la cuenta de servicio"
}
