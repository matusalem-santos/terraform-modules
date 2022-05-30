variable "hosted_name" {
  type = string
  description = ""
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}
