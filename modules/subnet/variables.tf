variable "subnet_name" {
    type = string
    default = "private"
}

variable "subnet_count" {
    type = number
    default = 1
}

variable "subnet_cidr_block" {
    type = number
    default = 10
}

variable "subnet_depens_on" {
    type = string
    default = null
}

variable "vpc_id" {
    type = string
}

variable "vpc_cidr_block" {
    type = string
}

variable "public_ip" {
    type = bool
    default = false
}

variable "workspace" {
    type = string
}

variable "tags" {
    type = map(string)
    description = "Tags para o recurso"
}

variable "cidr_blocks" {
    type = list
    default = []
}

variable "cidr_newbits" {
    type = number
    default = 4
}

variable "subnet_startnum" {
    type = number
    default = 0
}

variable "name" {
    type = list
    default = []
}

