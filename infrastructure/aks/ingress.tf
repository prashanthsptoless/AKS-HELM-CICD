resource "helm_release" "ingress" {
  chart     = "stable/nginx-ingress"
  keyring   = ""
  name      = "nginx-ingress"
  namespace = "apps"

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
