output "namespace_id" {
  value = try(lookup(local.created_namespace, var.namespace_type).id, null)
}

output "namespace_arn" {
  value = try(lookup(local.created_namespace, var.namespace_type).arn, null)
}

output "namespace_hosted_zone_id" {
  value = try(lookup(local.created_namespace, var.namespace_type).hosted_zone, null)
}

output "iam_read_only_role_arn" {
  value = try(var.create_iam_read_only_role ? aws_iam_role.iam_read_only_role[0].arn : null, null)
}

output "iam_read_write_role_arn" {
  value = try(var.create_iam_read_write_role ? aws_iam_role.iam_read_write_role[0].arn : null, null)
}
