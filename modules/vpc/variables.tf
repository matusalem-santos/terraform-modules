variable "vpc_cidr" {
    type    = string
    default = "172.10.0.0/16"
}

variable "vpc_tenancy" {
    type    = string
    default = "default"
}

variable "enable_dns_support" {
    type = bool
    description = "Habilitar suporte a DNS"
    default = true
}

variable "enable_dns_hostnames" {
    type = bool
    description = "Habilitar DNS Hostnames"
    default = true
}

variable "tags" {
    type = map(string)
    description = "Tags para o recurso"
}