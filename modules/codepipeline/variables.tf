variable "codepipeline_name" {
  description = "Name Pipeline, exemple: test_PRD"
  type        = string
}

variable "iam_role_codepipeline_arn" {
  type        = string
  description = "Optionally supply an existing role"
}

variable "bucket_pipeline_name" {
  description = "S3 Bucket Name"
}

variable "tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "repository_name" {
  type        = string
  description = "Repository CodeCommit name"
}

variable "codebuild_name" {
  type        = string
  description = "CodeBuild project name"
}

variable "branch_name" {
  type        = string
  description = "Branch name"
}

variable "poll_for_source_changes" {
  type = bool
  description = "Pesquisa de mudanças no source"
  default = "true"
}