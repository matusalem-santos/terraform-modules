
resource "aws_nat_gateway" "gateway" {
  count         = length(var.public_subnets) > 0 ?  length(var.public_subnets) : 0
  allocation_id = var.allocation_ids[count.index]
  subnet_id     = var.public_subnets[count.index]

  tags = merge(var.tags,
  {
      Terraform = "true"
  },)
}

