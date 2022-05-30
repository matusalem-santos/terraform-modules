
data "template_file" "buildspec" {
  template = file("buildspec.yml")
}

resource "aws_codebuild_project" "codebuild" {
  name          = var.codebuild_name
  description   = var.codebuild_description
  build_timeout = var.build_timeout
  service_role  = var.iam_build_role

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = var.env_compute_type
    image                       = var.env_image
    type                        = var.env_type
    image_pull_credentials_type = var.env_image_pull_credentials_type
    privileged_mode             = var.env_privileged_mode

    # Environment variables
    dynamic "environment_variable" {
    for_each = length(var.environment_variables) == 0 ? [] : var.environment_variables
    content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
        type  = lookup(environment_variable.value, "type", null) == null ? "PLAINTEXT" : environment_variable.value.type
    }
    }
  }

  logs_config {
    cloudwatch_logs {
      status = var.cw_log_status
    }

    s3_logs {
      encryption_disabled = var.s3_log_encryption_disabled
      status              = var.s3_log_status
    }
  }

  source {
    buildspec           = data.template_file.buildspec.rendered
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
    type                = "CODEPIPELINE"
  }

  tags = merge(var.tags,
  {
    Terraform = "true"
  },)
}
