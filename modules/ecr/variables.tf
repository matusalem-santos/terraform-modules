variable "ecr_repo_name" {
    type = string
    description = "ECR Repository Name"
}

variable "ecr_image_tag_mutability" {
    type = string
    default = "MUTABLE"
    description = "Image Tag Mutability"
}

variable "ecr_scan_on_push" {
    type = bool
    default = true
    description = "Scan on Push"
}

variable "tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}