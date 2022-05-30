locals {
  lc_name              = var.lc_name
  launch_configuration = var.create_lc ? var.launch_configuration : null
}

resource "null_resource" "tags_as_list_of_maps" {
  count = length(keys(var.tags_as_map))

  triggers = {
    key                 = keys(var.tags_as_map)[count.index]
    value               = values(var.tags_as_map)[count.index]
    propagate_at_launch = true
  }
}


data "cloudinit_config" "workers_userdata" {
  count = 1

  gzip          = false
  base64_encode = true
  boundary      = "//"

  part {
    content_type = "text/x-shellscript"
    content = file("userdata.sh.tpl")
  }
}

################################################################################
# Launch configuration
################################################################################

resource "aws_launch_configuration" "this" {
  count = var.create_lc ? 1 : 0

  name        = var.lc_use_name_prefix ? null : local.lc_name
  name_prefix = var.lc_use_name_prefix ? "${local.lc_name}-" : null

  ebs_optimized        = var.ebs_optimized
  image_id             = var.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile_name
  key_name             = var.key_name
  user_data            = var.user_data
  user_data_base64     = var.user_data_base64

  security_groups             = var.security_groups
  associate_public_ip_address = var.associate_public_ip_address

  enable_monitoring = var.enable_monitoring
  spot_price        = var.spot_price
  placement_tenancy = var.spot_price == null ? var.placement_tenancy : null

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      device_name           = ebs_block_device.value.device_name
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      no_device             = lookup(ebs_block_device.value, "no_device", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []
    content {
      http_endpoint               = lookup(metadata_options.value, "http_endpoint", null)
      http_tokens                 = lookup(metadata_options.value, "http_tokens", null)
      http_put_response_hop_limit = lookup(metadata_options.value, "http_put_response_hop_limit", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
