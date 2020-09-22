resource "aws_eks_node_group" "eks_nodegroup" {
  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "EKSTEST_nodegroup"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = concat(module.vpc.public_subnets, module.vpc.private_subnets)

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}