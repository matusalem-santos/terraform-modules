
data "aws_availability_zones" "available" {}

resource "aws_subnet" "aws_subnet" {
    vpc_id                  = var.vpc_id
    cidr_block              = length(var.cidr_blocks) == 0 ? cidrsubnet(var.vpc_cidr_block, var.cidr_newbits,var.subnet_startnum + count.index * var.subnet_cidr_block) : var.cidr_blocks[count.index] 
    availability_zone       = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = var.public_ip
    count = var.subnet_count  
    
    tags = merge(var.tags,
    {
        Name = length(var.cidr_blocks) == 0 ? "${var.workspace}-${var.subnet_name}-${count.index + 1}" : var.name[count.index]
        Terraform = "true"
    },)

    depends_on = [ var.subnet_depens_on ]
}
