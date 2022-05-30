
resource "aws_route_table" "rtb" {
  vpc_id = var.route_vpc_id
  
  tags = merge(var.tags,
  {
    Name = "${var.workspace}-${var.route_table_name}"
    Terraform = "true"
  },)

  depends_on = [ var.rtb_depens_on ]
}