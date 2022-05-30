
################################################################################
# Launch template
################################################################################

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = element(concat(aws_launch_template.this.*.id, [""]), 0)
}

output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = element(concat(aws_launch_template.this.*.arn, [""]), 0)
}

output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = element(concat(aws_launch_template.this.*.latest_version, [""]), 0)
}

output "launch_template_name" {
  description = "The ARN of the launch template"
  value       = element(concat(aws_launch_template.this.*.name, [""]), 0)
}
