resource "helm_release" "ingress" {
  name    = "nginx-ingress"
  chart   = "stable/nginx-ingress"
  keyring = ""

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
}
