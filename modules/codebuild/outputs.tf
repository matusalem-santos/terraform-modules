
output "codebuild_name" {
  description = "The output of the aws_codebuild_project resource"
  value       = aws_codebuild_project.codebuild.name
}