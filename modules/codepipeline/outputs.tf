output "pipeline-tags" {
  description = "The output of the aws_codepipeline resource"
  value       = aws_codepipeline.codepipeline.tags_all
}

output "pipeline-name" {
  description = "The output of the aws_codepipeline resource"
  value       = aws_codepipeline.codepipeline.name
}