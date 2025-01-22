variable "instance_name" {
  type        = string
  description = "Nombre de la instancia de Cloud SQL"
}

variable "project_id" {
  type        = string
  description = "ID del proyecto donde se crea la instancia"
}

variable "region" {
  type        = string
  description = "Región donde se crea la instancia"
  default     = "us-central1"
}

variable "database_version" {
  type        = string
  description = "Versión de la base de datos (POSTGRES_13, MYSQL_8_0, etc.)"
  default     = "POSTGRES_13"
}

variable "tier" {
  type        = string
  description = "Máquina de Cloud SQL (ej. db-f1-micro, db-g1-small, db-n1-standard-2, etc.)"
  default     = "db-f1-micro"
}

variable "public_ip" {
  type        = bool
  description = "Habilitar IP pública (true/false)"
  default     = true
}

variable "private_network" {
  type        = string
  description = "VPC para IP privada (data source google_compute_network, etc.)"
  default     = null
}

variable "database_name" {
  type        = string
  description = "Nombre de la base de datos inicial"
  default     = "app_db"
}

variable "db_user" {
  type        = string
  description = "Usuario principal de la DB"
  default     = "app_user"
}

variable "db_password" {
  type        = string
  description = "Password para el usuario principal"
  sensitive   = true
}
