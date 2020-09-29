variable "AWS_ACCOUNT_ID" {}
provider "kubernetes" {

  # AWS_ACCOUNT_ID is an environment variable the aws account ID :)
  config_context = "arn:aws:eks:eu-west-1:${var.AWS_ACCOUNT_ID}:cluster/EKSTEST"

}