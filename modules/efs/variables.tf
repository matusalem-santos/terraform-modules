variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "The CIDR blocks from which to allow `ingress` traffic to the EFS"
}

variable "access_points" {
  type        = map(map(map(any)))
  default     = {}
  description = <<-EOT
    A map of the access points you would like in your EFS volume

    See [examples/complete] for an example on how to set this up.
    All keys are strings. The primary keys are the names of access points.
    The secondary keys are `posix_user` and `creation_info`.
    The secondary_gids key should be a comma separated value.
    More information can be found in the terraform resource [efs_access_point](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point).
    EOT
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "subnets" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "associated_security_group_ids" {
  type        = list(string)
  description = "SGs IDs"
  default = []
}

variable "zone_id" {
  type        = list(string)
  default     = []
  description = <<-EOT
    Route53 DNS Zone ID as list of string (0 or 1 items). If empty, no custom DNS name will be published.
    If the list contains a single Zone ID, a custom DNS name will be pulished in that zone.
    Can also be a plain string, but that use is DEPRECATED because of Terraform issues.
    EOT
}

variable "encrypted" {
  type        = bool
  description = "If true, the file system will be encrypted"
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "If set, use a specific KMS key"
  default     = null
}

variable "performance_mode" {
  type        = string
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`"
  default     = "generalPurpose"
}

variable "provisioned_throughput_in_mibps" {
  type        = number
  default     = 0
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to provisioned"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
  default     = "bursting"
}

variable "mount_target_ip_address" {
  type        = string
  description = "The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target"
  default     = null
}

variable "dns_name" {
  type        = string
  description = "Name of the CNAME record to create"
  default     = ""
}

variable "lifecycle_policys" {
  type        = list(map(string))
  description = ""
  default     = []
}

variable "efs_backup_policy_enabled" {
  type        = bool
  description = "If `true`, it will turn on automatic backups."
  default     = false
}

variable "availability_zone_name" {
  type        = string
  description = "AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes. If set, a single subnet in the same availability zone should be provided to `subnets`"
  default     = null
}

variable "enabled" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}