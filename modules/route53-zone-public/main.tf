
# Recurso que provisiona o Hosted Zone no Route53
resource "aws_route53_zone" "public" {
  name = var.hosted_name


  tags = merge(var.tags,
    {
      Terraform = "true"
    },)
}
