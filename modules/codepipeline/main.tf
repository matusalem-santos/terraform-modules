
resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipeline_name
  role_arn = var.iam_role_codepipeline_arn

  artifact_store {
    location = var.bucket_pipeline_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName    = var.repository_name
        PollForSourceChanges = var.poll_for_source_changes
        BranchName       = var.branch_name
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_name
      }
    }
  }
  tags = merge(var.tags,
  {
    Terraform = "true"
  },)
}