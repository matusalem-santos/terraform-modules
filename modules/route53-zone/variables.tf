variable "hosted_name" {
  type = string
  description = ""
}

variable "comment" {
  type = string
  default     = "Managed by Terraform"
  description = " A comment for the hosted zone"
}

variable "vpc" {
  type        = list(any)
  default     = []
  description = "Configuration block(s) specifying VPC(s) to associate with a private hosted zone"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}
