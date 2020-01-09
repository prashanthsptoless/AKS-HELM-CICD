resource "helm_release" "ingress" {
  depends_on = [kubernetes_service_account.tiller]

  chart     = "stable/nginx-ingress"
  keyring   = ""
  name      = "nginx-ingress"
  namespace = "apps"

  set {
    name  = "controller.service.enableHttps"
    value = "false"
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "rbac.createRole"
    value = "true"
  }

  set {
    name  = "rbac.createClusterRole"
    value = "true"
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = azurerm_public_ip.ingress.ip_address
  }
}

resource "azurerm_public_ip" "ingress" {
  allocation_method   = "Static"
  domain_name_label   = "${local.environment}-container-demo"
  location            = local.resource_group.location
  name                = "${local.environment}-ingress"
  resource_group_name = azurerm_kubernetes_cluster.main.node_resource_group
  sku                 = "Standard"
}