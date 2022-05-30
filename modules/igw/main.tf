
resource "aws_internet_gateway" "igw" {
    vpc_id = var.igw_vpc_id
    tags = merge(var.tags,
    {
        Terraform = "true"
    },)
}