
# IAM groups policies
# this is where groups can assume their corresponding roles
resource "aws_iam_group_policy" "product_policy" {
  name  = "product_policy"
  group = aws_iam_group.product.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "123",
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/product"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_group_policy" "platform_policy" {
  name  = "platform_policy"
  group = aws_iam_group.platform.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "123",
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/platform"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_group_policy" "auditors_policy" {
  name  = "auditors_policy"
  group = aws_iam_group.auditors.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "123",
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::${var.AWS_ACCOUNT_ID}:role/auditors"
            ]
        }
    ]
}
EOF
}

