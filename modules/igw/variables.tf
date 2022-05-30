variable "igw_vpc_id" {
    type = string
    default = ""
}

variable "tags" {
    type = map(string)
    description = "Tags para o recurso"
}