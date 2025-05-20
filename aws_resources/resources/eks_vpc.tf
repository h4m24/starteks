module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v5.21.0"
  name   = "eks-vpc"
  cidr   = "10.20.0.0/16"

  # Warning:
  #
  # Do not change the order of the elements inside those arrays
  # Terraform doesnt know the difference between elements order changes
  # and actual subnet changes

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.20.0.0/19", "10.20.32.0/19", "10.20.64.0/19"]
  public_subnets  = ["10.20.160.0/19", "10.20.192.0/19", "10.20.224.0/19"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  # https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
  tags = {
    Terraform                       = "true"
    Environment                     = "eks"
    "kubernetes.io/cluster/EKSTEST" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}
