variable "bucket_name" {
  type        = string
  description = "Nombre único a nivel global para el bucket"
}

variable "location" {
  type        = string
  description = "Región o multirregión donde se creará el bucket"
  default     = "US"
}

variable "storage_class" {
  type        = string
  description = "Clase de almacenamiento (STANDARD, NEARLINE, etc.)"
  default     = "STANDARD"
}

variable "uniform_bucket_level_access" {
  type        = bool
  description = "Activa / desactiva el control uniforme de acceso"
  default     = true
}

variable "versioning" {
  type        = bool
  description = "Activa / desactiva el versionado de objetos"
  default     = false
}

variable "labels" {
  type        = map(string)
  description = "Etiquetas para el bucket"
  default     = {}
}
