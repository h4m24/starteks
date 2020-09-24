resource "aws_eks_cluster" "aws_eks" {
  name     = "EKSTEST"
  role_arn = aws_iam_role.eks_control_plane_role.arn

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
}

