# create ClusterRoles inside k8s
resource "kubernetes_cluster_role" "product_role" {
  metadata {
    name = "product-role"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role" "platform_role" {
  metadata {
    name = "platform-role"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role" "auditors_role" {
  metadata {
    name = "auditors-role"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
}


# Create RoleBindings, grant permission at the cluster level and in all namespaces
resource "kubernetes_cluster_role_binding" "product-role-binding" {
  metadata {
    name = "product-role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "product-role"
  }
  subject {
    kind      = "Group"
    name      = "company:product-team"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding" "platform-role-binding" {
  metadata {
    name = "platform-role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "platform-role"
  }
  subject {
    kind      = "Group"
    name      = "company:platform-team"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding" "auditors-role-binding" {
  metadata {
    name = "auditors-role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "auditors-role"
  }
  subject {
    kind      = "Group"
    name      = "company:auditors-team"
    api_group = "rbac.authorization.k8s.io"
  }
}


