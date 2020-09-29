resource "kubernetes_service_account" "k8s_test_service_account" {
  metadata {
    name = "k8s-test-service-account"
    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/aws_eks_test_service_role"

    }
  }
}