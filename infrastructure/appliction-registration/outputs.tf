output "object_id" {
  sensitive = true
  value     = azuread_service_principal.aks.object_id
}

output "application_id" {
  value     = azuread_service_principal.aks.application_id
  sensitive = true
}

output "client_secret" {
  value     = random_uuid.password.result
  sensitive = true
}
