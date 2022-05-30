variable "subnet_ids" {
    type = list(string)
    default = []
}

variable "route_table_id" {
    type = string
    default = ""
}

variable "assoc_depends_on" {
    type = string
    default = null
}
