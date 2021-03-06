output "namespace_id" {
  value = try(lookup(local.created_namespace, var.type).id, null)
}

output "namespace_arn" {
  value = try(lookup(local.created_namespace, var.type).arn, null)
}

output "namespace_name" {
  value = try(var.name, null)
}

output "namespace_hosted_zone_id" {
  value = try(lookup(local.created_namespace, var.type).hosted_zone, null)
}

output "iam_read_only_policy_arn" {
  value = try(aws_iam_policy.iam_read_only_policy.arn, null)
}

output "iam_read_only_role_arn" {
  value = try(var.create_iam_read_only_role ? aws_iam_role.iam_read_only_role[0].arn : null, null)
}

output "iam_read_write_policy_arn" {
  value = try(aws_iam_policy.iam_read_write_policy.arn, null)
}

output "iam_read_write_role_arn" {
  value = try(var.create_iam_read_write_role ? aws_iam_role.iam_read_write_role[0].arn : null, null)
}
