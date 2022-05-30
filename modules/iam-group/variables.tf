variable "name" {
    type = string
    description = "Nome do grupo"
}

variable "path" {
    type = string
    default = "/"
    description = "Caminho do grupo"
}

variable "policy_arns" {
    type = list(string)
    description = "Lista com o arn das policys"
    default = [ "" ]
}