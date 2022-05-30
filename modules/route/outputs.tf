output "rtb-priv-id" {
    value = aws_route.nat.*.id
    depends_on = [
      aws_route.nat
    ]
}

output "rtb-pub-id" {
    value = aws_route.igw.*.id
    depends_on = [
      aws_route.igw
    ]
}


output "rtb-priv-destination_cidr_block" {
    value = aws_route.nat.*.destination_cidr_block
    depends_on = [
      aws_route.nat
    ]
}

output "rtb-pub-destination_cidr_block" {
    value = aws_route.igw.*.destination_cidr_block
    depends_on = [
      aws_route.igw
    ]
}