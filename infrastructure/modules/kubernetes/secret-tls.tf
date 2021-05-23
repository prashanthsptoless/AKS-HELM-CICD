resource "kubernetes_secret" "tls" {
  type = "kubernetes.io/tls"

  metadata {
    name      = "ingress-tls"
    namespace = kubernetes_namespace.apps.metadata.0.name
  }

  data = {
    "tls.crt" = base64decode(data.azurerm_key_vault_secret.certificate_data.value)
    "tls.key" = base64decode(data.azurerm_key_vault_secret.certificate_data.value)
  }
}