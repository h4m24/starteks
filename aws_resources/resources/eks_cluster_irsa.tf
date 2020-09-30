# Define a new ids for aws which comes from k8s
resource "aws_iam_openid_connect_provider" "aws_eks_openid_connector" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = []
  url             = aws_eks_cluster.aws_eks.identity[0].oidc[0].issuer
}

# example of a service on EKS and its Iam Role and its assume role Policy
resource "aws_iam_role" "aws_eks_test_service_role" {
  assume_role_policy = data.aws_iam_policy_document.aws_eks_example_services_assume_role_policy.json
  name               = "aws_eks_test_service_role"
}

data "aws_iam_policy_document" "aws_eks_example_services_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.aws_eks_openid_connector.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.aws_eks_openid_connector.arn]
      type        = "Federated"
    }
  }
}