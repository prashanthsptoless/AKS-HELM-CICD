resource "azuread_application" "aks" {
  name = "${local.environment}-aks-app"
}

resource "azuread_service_principal" "aks" {
  application_id               = azuread_application.aks.application_id
  app_role_assignment_required = false

  tags = ["Demos"]
}

resource "azuread_application_password" "credential" {
  application_object_id = azuread_application.aks.id
  value                 = random_uuid.password.result
  end_date_relative     = "48h"
}

resource "random_uuid" "password" {}
