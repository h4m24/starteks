resource "aws_s3_bucket" "tfstate" {
  bucket = "h4m24-terraformstate"
  acl    = "private"
  force_destroy = true
  versioning {
    enabled = false
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }


}

