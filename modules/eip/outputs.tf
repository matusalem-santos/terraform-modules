output "elastic_ip" {
  value = aws_eip.nat_gateway.*.public_ip
}

output "id" {
  value = aws_eip.nat_gateway.*.id
}