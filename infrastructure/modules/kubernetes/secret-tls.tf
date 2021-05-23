locals {
  tls_data = data.azurerm_key_vault_secret.certificate_data.value
}

resource "kubernetes_secret" "tls" {
  type = "kubernetes.io/tls"

  metadata {
    name      = "ingress-tls"
    namespace = kubernetes_namespace.apps.metadata.0.name
  }

  binary_data = {
    "tls.crt" = local.tls_data
    "tls.key" = local.tls_data
  }
}