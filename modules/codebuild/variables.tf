variable "codebuild_name" {
  type        = string
  description = "CodeBuild Name"
}

variable "codebuild_description" {
  type        = string
  description = "Description"
  default     = ""
}

variable "build_timeout" {
  type        = string
  description = "timeout"
  default     = "60"
}

variable "iam_build_role" {
  type        = string
  description = "Optionally supply an existing role"
}

variable "artifacts_type" {
  type        = string
  description = "Artifacts type"
  default     = "CODEPIPELINE"
}

# variable "bucket_cache_name" {
#   type        = string
#   description = "S3 Bucket name for cache"
#   default     = ""
# }

variable "env_compute_type" {
  type        = string
  description = "Environment Compute Type "
  default     = ""
}

variable "env_image" {
  type        = string
  description = "Environment Image"
  default     = ""
}

variable "env_type" {
  type        = string
  description = "Environment Type"
  default     = ""
}

variable "env_privileged_mode" {
  type        = bool
  description = "Environment Privileged Mode"
  default     = true
}

variable "env_image_pull_credentials_type" {
  type        = string
  description = "Environment Image Pull"
  default     = ""
}

variable "environment_variables" {
  type        = list(any)
  description = "Variables for buildspec"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}

# variable "cw_log_group_name" {
#   type        = string
#   description = "CloudWatch log group name"
#   default     = ""
# }

# variable "cw_log_stream_name" {
#   type        = string
#   description = "CloudWatch log stream name"
#   default     = ""
# }

variable "cw_log_status" {
  type        = string
  description = "CloudWatch Log Status"
  default     = "ENABLED"
}

variable "s3_log_status" {
  type        = string
  description = "s3 Log Status"
  default     = "DISABLED"
}

variable "s3_log_encryption_disabled" {
  type        = bool
  description = "s3 Log encryption_disabled"
  default     = false
}
# variable "s3_log_location" {
#   type        = string
#   description = "S3 Log Location"
#   default     = ""
# }

