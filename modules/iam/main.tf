# Crear una cuenta de servicio
resource "google_service_account" "this" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = var.project_id
}

# Asignar roles a la cuenta de servicio
resource "google_project_iam_member" "iam_binding" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.this.email}"
}
