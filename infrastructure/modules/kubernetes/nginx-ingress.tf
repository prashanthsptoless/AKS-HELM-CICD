resource "helm_release" "nginx_ingress" {
  chart      = "ingress-nginx"
  name       = "gateway"
  namespace  = kubernetes_namespace.apps.metadata.0.name
  repository = "https://kubernetes.github.io/ingress-nginx"

  set {
    name  = "kind"
    value = "DaemonSet"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.service.ports.https"
    value = "443"
  }

  set {
    name = "controller.service.annotations"
    value = yamlencode({
      "service.beta.kubernetes.io/azure-load-balancer-internal" = true
    })
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = cidrhost(var.aks_subnet_cidr, 250)
  }
}