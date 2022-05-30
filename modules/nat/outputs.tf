
output "id" {
  value = aws_nat_gateway.gateway.*.id
}


output "public_ip" {
  value = aws_nat_gateway.gateway.*.public_ip
}

