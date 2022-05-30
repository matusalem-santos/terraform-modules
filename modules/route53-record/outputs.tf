output dns {
  value       = aws_route53_record.record.fqdn
  description = "dns record"
}