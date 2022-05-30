
# Recurso que provisiona o Hosted Zone no Route53
resource "aws_route53_zone" "private" {
  name      = var.hosted_name
  comment   = var.comment

  dynamic "vpc" {
    for_each = var.vpc
    content {
      vpc_id            = lookup(vpc.value, "vpc_id", null)
      vpc_region        = lookup(vpc.value, "vpc_region", null)
    }
  }

  tags = merge(var.tags,
    {
      Terraform = "true"
    },)

}
