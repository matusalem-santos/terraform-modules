variable "rtb_id" {
    type = string
    default = ""
}

variable "rtb_destinations" {
    type = list(string)
    default = []
}

variable "rtb_gateways" {
    type = list(string)
    default = []
}

variable "rtb_nat_gateways" {
    type = list(string)
    default = []
}

variable "route_depends_on" {
    type = string
    default = null
}
