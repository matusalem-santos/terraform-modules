output "ecr-url" {
    value = aws_ecr_repository.ecr-repo.repository_url
}

output "ecr-repo-name" {
    value = aws_ecr_repository.ecr-repo.name
}