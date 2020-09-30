
# update aws-auth config map to map k8s group to aws iam role
resource "kubernetes_config_map" "aws_auth_update" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = <<ROLES
- rolearn: arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/eks_node_group_role
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
- roleARN: arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/product
  username: "{{SessionName}}"
  groups:
  - company:product-team
- roleARN: arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/platform
  username: "{{SessionName}}"
  groups:
  - company:platform-team
- roleARN: arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/auditors
  username: "{{SessionName}}"
  groups:
  - company:auditors-team
ROLES

  }
}

