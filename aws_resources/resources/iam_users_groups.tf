# users
resource "aws_iam_user" "jack" {
  name = "jack"
}
resource "aws_iam_user" "jim" {
  name = "jim"
}
resource "aws_iam_user" "joe" {
  name = "joe"
}

# groups
resource "aws_iam_group" "product" {
  name = "product"
}
resource "aws_iam_group" "platform" {
  name = "platform"
}
resource "aws_iam_group" "auditors" {
  name = "auditors"
}

# memberships
resource "aws_iam_user_group_membership" "product_membership" {
  user   = aws_iam_user.jack.name
  groups = [aws_iam_group.product.name]
}
resource "aws_iam_user_group_membership" "platform_membership" {
  user   = aws_iam_user.jim.name
  groups = [aws_iam_group.platform.name]
}
resource "aws_iam_user_group_membership" "auditors_membership" {
  user   = aws_iam_user.joe.name
  groups = [aws_iam_group.auditors.name]
}
