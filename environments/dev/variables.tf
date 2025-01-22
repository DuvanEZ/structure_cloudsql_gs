variable "project_id" {
  type        = string
  description = "ID del proyecto de GCP"
}

variable "region" {
  type        = string
  description = "Región para Cloud Run, Cloud SQL, etc."
  default     = "us-central1"
}
variable "zone" {
  type        = string
  description = "Zona para recursos regionales (ej. us-central1-a)"
  default     = "us-central1-a" # Ajusta según tu configuración
}

variable "bucket_location" {
  type        = string
  description = "Región o multirregión donde se creará el bucket"
  default     = "US"
}

variable "storage_class" {
  type        = string
  description = "Clase de almacenamiento (STANDARD, NEARLINE, etc.)"
  default     = "STANDARD"
}


variable "db_password" {
  type        = string
  description = "Contraseña para el usuario de la base de datos"
  sensitive   = true
}
