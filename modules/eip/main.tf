
resource "aws_eip" "nat_gateway" {
  count = var.num_eip
  vpc   = true

  tags = merge(var.tags,
  {
      Terraform = "true"
  },)
}