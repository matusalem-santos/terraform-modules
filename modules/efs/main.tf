
locals {
  enabled                = var.enabled

  dns_name = format("%s.efs.%s.amazonaws.com", join("", aws_efs_file_system.default.*.id), var.region)
  # Returning null in the lookup function gives type errors and is not omitting the parameter.
  # This work around ensures null is returned.
  posix_users = {
    for k, v in var.access_points :
    k => lookup(var.access_points[k], "posix_user", {})
  }
  secondary_gids = {
    for k, v in var.access_points :
    k => lookup(local.posix_users, "secondary_gids", null)
  }
}

resource "aws_efs_file_system" "default" {
  #bridgecrew:skip=BC_AWS_GENERAL_48: BC complains about not having an AWS Backup plan. We ignore this because this can be done outside of this module.
  count                           = local.enabled ? 1 : 0
  tags                            = var.tags
  availability_zone_name          = var.availability_zone_name
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policys
    content {
      transition_to_ia                    = try(lifecycle_policy.value["transition_to_ia"], null)
      transition_to_primary_storage_class = try(lifecycle_policy.value["transition_to_primary_storage_class"], null)
    }
  }
}

resource "aws_efs_mount_target" "default" {
  count          = local.enabled && length(var.subnets) > 0 ? length(var.subnets) : 0
  file_system_id = join("", aws_efs_file_system.default.*.id)
  ip_address     = var.mount_target_ip_address
  subnet_id      = var.subnets[count.index]
  security_groups = var.associated_security_group_ids

}

resource "aws_efs_access_point" "default" {
  for_each = var.access_points

  file_system_id = join("", aws_efs_file_system.default.*.id)

  dynamic "posix_user" {
    for_each = local.posix_users[each.key] != null ? ["true"] : []

    content {
      gid            = local.posix_users[each.key]["gid"]
      uid            = local.posix_users[each.key]["uid"]
      secondary_gids = local.secondary_gids[each.key] != null ? split(",", local.secondary_gids[each.key]) : null
    }
  }

  root_directory {
    path = "/${each.key}"

    dynamic "creation_info" {
      for_each = try(var.access_points[each.key]["creation_info"]["gid"], "") != "" ? ["true"] : []

      content {
        owner_gid   = var.access_points[each.key]["creation_info"]["gid"]
        owner_uid   = var.access_points[each.key]["creation_info"]["uid"]
        permissions = var.access_points[each.key]["creation_info"]["permissions"]
      }
    }
  }

  tags = var.tags
}

resource "aws_efs_backup_policy" "policy" {
  count = var.enabled ? 1 : 0

  file_system_id = join("", aws_efs_file_system.default.*.id)

  backup_policy {
    status = var.efs_backup_policy_enabled ? "ENABLED" : "DISABLED"
  }
}
