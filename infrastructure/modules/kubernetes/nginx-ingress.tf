resource "helm_release" "nginx_ingress" {
  chart      = "ingress-nginx"
  name       = "gateway"
  namespace  = kubernetes_namespace.apps.metadata.0.name
  repository = "https://kubernetes.github.io/ingress-nginx"
  reuse_values = true

  set {
    name  = "controller.extraArgs.default-ssl-certificate"
    value = "${kubernetes_secret.tls.metadata.0.namespace}/${kubernetes_secret.tls.metadata.0.name}"
  }

  set {
    name  = "controller.kind"
    value = "DaemonSet"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal"
    value = "true"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.service.enableHttp"
    value = "false"
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = cidrhost(var.aks_subnet_cidr, 250)
  }

  set {
    name  = "controller.service.ports.https"
    value = "443"
  }
}