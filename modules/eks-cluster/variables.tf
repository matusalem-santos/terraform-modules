variable "iam_cluster_arn" {
    type = string
}

variable "controlplane_security_groups" {
    type = list(string)
}

variable "subnets" {
    type = list(string)
}

variable "name" {
    type = string
    description = "name do cluster eks"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "service_ipv4_cidr" {
    type = string
    description = "CIDR do cluster"
}

variable "ip_family" {
    type = string
    description = "Definir IPV4 ou IPV6"
}
