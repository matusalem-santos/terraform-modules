variable "route_vpc_id" {
    type = string
    default = ""
}

variable "route_table_name" {
    type = string
    default = "default"
}

variable "rtb_depens_on" {
    type = string
    default = null
}

variable "workspace" {
    type = string
}

variable "tags" {
    type = map(string)
    description = "Tags para o recurso"
}