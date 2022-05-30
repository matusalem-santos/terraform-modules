
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.name
  role_arn = var.iam_cluster_arn

  vpc_config {

    security_group_ids = var.controlplane_security_groups
    subnet_ids         = var.subnets
  }
  
  kubernetes_network_config {
    service_ipv4_cidr = var.service_ipv4_cidr
    ip_family         = var.ip_family
  }
  tags = merge(var.tags,
  {
    Terraform = "true"
  },)
}
