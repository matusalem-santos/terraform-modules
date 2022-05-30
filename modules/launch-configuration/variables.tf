
################################################################################
# Launch configuration
################################################################################

variable "create_lc" {
  description = "Determines whether to create launch configuration or not"
  type        = bool
  default     = false
}

variable "use_lc" {
  description = "Determines whether to use a launch configuration in the autoscaling group or not"
  type        = bool
  default     = false
}

variable "lc_name" {
  description = "Name of launch configuration to be created"
  type        = string
  default     = ""
}

variable "lc_use_name_prefix" {
  description = "Determines whether to use `lc_name` as is or create a unique name beginning with the `lc_name` as the prefix"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "(LC) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see `user_data_base64` instead"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "(LC) Associate a public ip address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "spot_price" {
  description = "(LC) The maximum price to use for reserving spot instances (defaults to on-demand price)"
  type        = string
  default     = null
}

variable "placement_tenancy" {
  description = "(LC) The tenancy of the instance. Valid values are `default` or `dedicated`"
  type        = string
  default     = null
}

variable "ebs_block_device" {
  description = "(LC) Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}

variable "ephemeral_block_device" {
  description = "(LC) Customize Ephemeral (also known as 'Instance Store') volumes on the instance"
  type        = list(map(string))
  default     = []
}

variable "root_block_device" {
  description = "(LC) Customize details about the root block device of the instance"
  type        = list(map(string))
  default     = []
}


################################################################################
# Common - launch configuration or launch template
################################################################################

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "iam_instance_profile_name" {
  description = "The name attribute of the IAM instance profile to associate with launched instances"
  type        = string
  default     = null
}

variable "image_id" {
  description = "The AMI from which to launch the instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The type of the instance to launch"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The key name that should be used for the instance"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "The Base64-encoded user data to provide when launching the instance"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "A list of security group IDs to associate"
  type        = list(string)
  default     = null
}

variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring"
  type        = bool
  default     = null
}

variable "metadata_options" {
  description = "Customize the metadata options for the instance"
  type        = map(string)
  default     = null
}


variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch"
  type        = list(map(string))
  default     = []
}

variable "tags_as_map" {
  description = "A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires."
  type        = map(string)
  default     = {}
}

variable "propagate_name" {
  description = "Determines whether to propagate the ASG Name tag or not"
  type        = bool
  default     = true
}