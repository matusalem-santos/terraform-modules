variable "repository_name" {
  type        = string
  description = "The name of your GIT repository"
  default     = ""
}

variable "default_branch" {
  type        = string
  description = "The name of the default repository branch"
  default     = "master"
}

variable "project" {
  type        = string
  description = "Name of the project"
  default     = ""
}

variable "tags" {
  description = "Mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "region" {
  type        = string
  description = "Name of the region"
  default     = ""
}