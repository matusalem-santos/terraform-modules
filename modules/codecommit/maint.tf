
resource "aws_codecommit_repository" "repo" {
  repository_name = var.repository_name
  description     = var.project
  default_branch  = var.default_branch

  #Tags
  tags = merge(var.tags,
  {
    Terraform = "true"
  },)
}
