resource "aws_cloudwatch_log_group" "group" {
  name              = var.name
  retention_in_days = var.retention_in_days

  tags = merge(var.tags,
  {
    Terraform = "true"
  },)

}