module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v2.51.0"
  name   = "eks-vpc"
  cidr   = "10.20.0.0/16"

  # Warning:
  #
  # Do not change the order of the elements inside those arrays
  # Terraform doesnt know the difference between elements order changes
  # and actual subnet changes

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  public_subnets  = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform                       = "true"
    Environment                     = "eks"
    "kubernetes.io/cluster/EKSTEST" = "shared"
  }
}
