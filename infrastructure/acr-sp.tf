resource "azuread_application" "acr" {
  name = "container-pipelines-demo-acr"
}

resource "azuread_service_principal" "acr" {
  application_id               = azuread_application.acr.application_id
  app_role_assignment_required = false

  tags = ["Demos"]
}

resource "azurerm_role_assignment" "k8s_acrpush" {
  principal_id         = azuread_service_principal.acr.object_id
  scope                = azurerm_container_registry.basic.id
  role_definition_name = "AcrPush"
}

# Note: no credential is assigned at this time, will create manually when needed by Azure DevOps