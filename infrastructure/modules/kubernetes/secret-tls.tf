resource "kubernetes_secret" "tls" {
  type = "kubernetes.io/tls"

  metadata {
    name      = "ingress-tls"
    namespace = kubernetes_namespace.apps.metadata.0.name
  }

  data = {
    "tls.crt" = var.tls["cert"]
    "tls.key" = var.tls["key"]
  }
}