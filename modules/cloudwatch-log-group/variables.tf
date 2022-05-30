variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = ""
  type        = string
}

variable "retention_in_days" {
    type = number
    default = 7
    description = "(optional) describe your variable"
}