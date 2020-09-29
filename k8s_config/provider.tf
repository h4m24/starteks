variable "AWS_ACCOUNT_ID" {}
provider "kubernetes" {

  # AWS_ACCOUNT_ID is an environment variable the aws account ID :)
  config_context = "EKSTEST"

}