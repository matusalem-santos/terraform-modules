variable "policy_name" {
    type = string
    description = "Nome da politica"
}

variable "policy_path" {
    type = string
    default = "/"
    description = "Caminho da politica"
}

variable "policy_description" {
    type = string
    description = "Descrição da politica"
    default = ""
}

variable "policy" {
    type = any
    description = "Politica"
}


variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags."
}