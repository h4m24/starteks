# Groups roles
# this is where roles are defined and trust to be assumed from within the account

resource "aws_iam_role" "product_role" {
  name = "product"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.AWS_ACCOUNT_ID}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role" "platform_role" {
  name = "platform"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.AWS_ACCOUNT_ID}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role" "auditors_role" {
  name = "auditors"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.AWS_ACCOUNT_ID}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Iam Policies and attachment to roles
# This is where specific groups are allowed specific permissions
# will attach readonly to all aws iam roles for testing purposes

resource "aws_iam_role_policy_attachment" "product-attach" {
  role      = aws_iam_role.product_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
resource "aws_iam_role_policy_attachment" "platform-attach" {
  role      = aws_iam_role.platform_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
resource "aws_iam_role_policy_attachment" "auditors-attach" {
  role      = aws_iam_role.auditors_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}