
resource "aws_iam_group" "users" {
  name = var.name
  path = var.path
}

resource "aws_iam_group_policy_attachment" "policy-attach" {
  for_each = toset(var.policy_arns)
  group      = aws_iam_group.users.name
  policy_arn = each.key
}