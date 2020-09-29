resource "aws_eks_cluster" "aws_eks" {
  name     = "EKSTEST"
  role_arn = aws_iam_role.eks_control_plane_role.arn
  version  = "1.15"

  vpc_config {
    subnet_ids = concat(module.vpc.public_subnets, module.vpc.private_subnets)

    # control plane and nodegroup security groups
    # security_group_ids      = compact([local.cluster_security_group_id])

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = {
    Name = "EKSTEST"
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # The CMK must be symmetric, created in the same region as the cluster
  encryption_config {
    provider {
      key_arn = aws_kms_key.aws_eks_cmk_key.arn
    }
    resources = ["secrets"]
  }
}


resource "aws_kms_key" "aws_eks_cmk_key" {

  description              = "this key is used for main EKS encryption settings"
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"

  # we will use the default policy allowing this account full access to the key
  # https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html
  # policy = 

  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = false

  tags = {
    Name = "EKSTEST"
  }
}
