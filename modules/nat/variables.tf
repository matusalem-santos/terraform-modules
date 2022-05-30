variable "public_subnets" {
  type = list(string)
}

variable "allocation_ids" {
  type = list(string)
}

variable "tags" {
  type        = map(string)
  description = "Optional extra tags"
  default     = {}
}