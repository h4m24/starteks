terraform {
  backend "s3" {
    encrypt = false
    bucket  = "h4m24-terraformstate"
    key     = "k8s"

    dynamodb_table = "terraform-state-lock-dynamo"
    region         = "eu-west-1"
  }
}