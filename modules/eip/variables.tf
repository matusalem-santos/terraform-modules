variable "num_eip" {
    type = number
    description = "Número de EIP que serão criados"
}

variable "tags" {
  type        = map(string)
  description = "Optional extra tags"
  default     = {}
}