variable "type" {
  type = string
  description = "type"
}

variable "name" {
  type = string
  description = "name"
}

variable "ttl" {
  type = string
  description = "Route53 zone id"
}

variable "records" {
  type = list(string)
  description = "records"
}

variable "route53_zone_id" {
  type = string
  description = "zone id"
}