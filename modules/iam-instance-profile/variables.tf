variable "profile_name" {
    type = string
    default = "instance_profile"
}

variable "role_name" {
    type = string
}

variable "workspace" {
    type = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}