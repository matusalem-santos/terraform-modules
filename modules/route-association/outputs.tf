output "id" {
    value = aws_route_table_association.rtb_assoc.*.id
}