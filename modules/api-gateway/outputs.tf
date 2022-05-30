# Module      : Api Gateway
# Description : Terraform Api Gateway module outputs.
output "id" {
  value       = join("", aws_api_gateway_rest_api.default.*.id)
  description = "The ID of the REST API."
}

output "execution_arn" {
  value       = join("", aws_api_gateway_rest_api.default.*.execution_arn)
  description = "The Execution ARN of the REST API."
}

output "dns" {
  value       = "https://${join("", aws_api_gateway_domain_name.dns-api.*.domain_name)}"
  description = "The Execution ARN of the REST API."
}

output "stage-arn" {
  value = join("", aws_api_gateway_stage.with_log.*.arn)
  description = "Stage name"
}

output "x_api_key" {
  value = join("", aws_api_gateway_usage_plan_key.main.*.value)
  description = "Key da api"
}