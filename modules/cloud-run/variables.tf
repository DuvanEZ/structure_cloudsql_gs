variable "service_name" {
  type        = string
  description = "Nombre del servicio de Cloud Run"
}

variable "location" {
  type        = string
  description = "Región donde se despliega Cloud Run"
  default     = "us-central1"
}

variable "image" {
  type        = string
  description = "URL de la imagen container (p.ej. gcr.io/proyecto/imagen:tag)"
}

variable "environment_tag" {
  type        = string
  description = "Etiqueta para el entorno (dev, staging, prod)"
}

variable "service_account" {
  type        = string
  description = "Cuenta de servicio que usará Cloud Run"
  default     = null
}

variable "project_id" {
  type        = string
  description = "ID del proyecto de GCP"
}

variable "run_invoker_member" {
  type        = string
  description = "Miembro IAM para invocar el servicio (allUsers, allAuthenticatedUsers, etc.)"
  default     = "allUsers"
}
