resource "helm_release" "nginx_ingress" {
  chart      = "ingress-nginx"
  name       = "gateway"
  namespace  = kubernetes_namespace.apps.metadata.0.name
  repository = "https://kubernetes.github.io/ingress-nginx"

  #   values = [
  #     file("nginx-ingress/values.yaml")
  #   ]
}