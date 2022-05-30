variable "policy_name" {
    type = string
    default = "CodePipelineGeneral"
    description = "Policy Name"
}

variable "role_name" {
    type = string
    default = "CodePipelineGeneral"
    description = "Role Name"
}

variable "tags" {
    type = map(string)
    description = "Tags"
}