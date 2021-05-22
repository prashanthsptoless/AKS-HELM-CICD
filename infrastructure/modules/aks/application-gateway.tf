locals {
  backend_address_pool_name      = "aks"
  backend_http_settings_name     = "aks"
  frontend_ip_configuration_name = "primary"
  frontend_port_name             = "http"
  http_listener_name             = "aks"
}

resource "azurerm_application_gateway" "agw" {
  location            = local.resource_group.location
  name                = local.application_gateway_name
  resource_group_name = local.resource_group.name
  tags                = local.resource_group.tags

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    cookie_based_affinity = "Disabled"
    name                  = local.backend_http_settings_name
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
    connection_draining {
      enabled           = false
      drain_timeout_sec = 1
    }
  }

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "ip-01"
    subnet_id = azurerm_subnet.subnet["applicationgateway-subnet"].id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agw.id
  }

  http_listener {
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    name                           = local.http_listener_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "aks"
    rule_type                  = "Basic"
    http_listener_name         = local.http_listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.backend_http_settings_name

  }
}

