variable "eks_cluster_name" {
    type = string
}

variable "node_role_arn" {
    type = string
}

variable "timeout_create" {
    type = string
    default = "10m"
}

variable "timeout_delete" {
    type = string
    default = "10m"
}

variable "subnets" {
    type = list(string)
}

variable "desired" {
    type = number
    default = 1
}

variable "max" {
    type = number
    default = 2
}

variable "min" {
    type = number
    default = 1
}

variable "node_group_name" {
    type = string
    default = "eks_node"
}

variable "instance_types" {
    type = list(string)
    default = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "use_lt" {
    type = bool
    default = false
    description = "Usar launch template"
}

variable "launch_template_id" {
    type = string
    default = ""
    description = "launch_template_id"
}

variable "launch_template_version" {
    type = string
    default = ""
    description = "launch_template_version"
}

variable "capacity_type" {
    type = string
    default = "SPOT"
    description = "Type of capacity associated with the EKS Node Group."
}