
resource aws_route53_record record {

  type     = var.type
  name     = var.name
  zone_id  = var.route53_zone_id
  ttl      = var.ttl

  records  = var.records

}