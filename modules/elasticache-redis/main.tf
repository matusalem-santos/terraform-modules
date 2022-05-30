
resource "aws_elasticache_replication_group" "redis" {
  engine = "redis"

  parameter_group_name = aws_elasticache_parameter_group.redis.name
  security_group_ids   = var.security_group_ids
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  availability_zones    = var.availability_zones
  replication_group_id  = "${var.name_prefix}"
  number_cache_clusters = var.cluster_mode_enabled ? null : var.number_cache_clusters
  node_type             = var.node_type

  engine_version = var.engine_version
  port           = var.port

  maintenance_window         = var.maintenance_window
  snapshot_window            = var.snapshot_window
  snapshot_retention_limit   = var.snapshot_retention_limit
  final_snapshot_identifier  = var.final_snapshot_identifier
  automatic_failover_enabled = var.automatic_failover_enabled && var.number_cache_clusters > 1 ? true : false
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  multi_az_enabled           = var.multi_az_enabled

  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                 = var.auth_token != "" ? var.auth_token : null
  kms_key_id                 = var.kms_key_id

  apply_immediately = var.apply_immediately

  replication_group_description = var.description

  notification_topic_arn = var.notification_topic_arn

  dynamic "cluster_mode" {
    for_each = var.cluster_mode_enabled ? [1] : []
    content {
      replicas_per_node_group = var.replicas_per_node_group
      num_node_groups         = var.num_node_groups
    }
  }

  #tags = merge(
    #{
      #"Name" = "${var.name_prefix}-redis"
    #},
    #var.tags,
  #)

  tags = merge(var.tags,
  {
    Terraform = "true"
  },)

}

resource "random_id" "redis_pg" {
  keepers = {
    family = var.family
  }

  byte_length = 2
}

resource "aws_elasticache_parameter_group" "redis" {
  name        = "${var.name_prefix}-${random_id.redis_pg.hex}"
  family      = var.family
  description = var.description

  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }  

  lifecycle {
    create_before_destroy = true
  }

  #tags = var.tags
  tags = merge(var.tags,
  {
    Terraform = "true"
  },)

} 

resource "aws_elasticache_subnet_group" "redis" {
  name        = "${var.name_prefix}"
  subnet_ids  = var.subnet_ids
  description = var.description

  #tags = var.tags

  tags = merge(var.tags,
  {
    Terraform = "true"
  },)

}