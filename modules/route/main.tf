
resource "aws_route" "igw" {
    count = length(var.rtb_destinations) > 0 && length(var.rtb_gateways) > 0 ? length(var.rtb_destinations) : 0
    route_table_id = var.rtb_id
    destination_cidr_block = element(var.rtb_destinations, count.index)
    gateway_id = element(var.rtb_gateways, count.index)
    depends_on = [ var.route_depends_on ]
}

resource "aws_route" "nat" {
    count = length(var.rtb_destinations) > 0 && length(var.rtb_nat_gateways) > 0 ? length(var.rtb_destinations) : 0
    route_table_id = var.rtb_id
    destination_cidr_block = element(var.rtb_destinations, count.index)
    nat_gateway_id = element(var.rtb_nat_gateways, count.index)
    depends_on = [ var.route_depends_on ]
}