
resource "aws_ecr_repository" "ecr-repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = var.ecr_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr_scan_on_push
  }

  tags = merge(var.tags,
  {
    Terraform = "true"
  },)
}