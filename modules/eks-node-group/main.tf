
resource "aws_eks_node_group" "node" {
  cluster_name    = var.eks_cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnets
  instance_types  = var.instance_types
  capacity_type   = var.capacity_type

  dynamic "launch_template" {
    for_each = var.use_lt ? [1] : []

    content {
      id      = var.launch_template_id
      version = var.launch_template_version
    }
  }


  tags = merge(var.tags,
  {
    Name      = var.node_group_name
    Terraform = "true"
  },)
  scaling_config {
    desired_size = var.desired
    max_size     = var.max
    min_size     = var.min
  }
  timeouts {
    create = var.timeout_create
    delete = var.timeout_delete
  }
}