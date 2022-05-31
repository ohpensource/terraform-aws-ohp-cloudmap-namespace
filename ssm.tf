resource "aws_ssm_parameter" "namespace_id" {
  count = var.create_ssm_parameters ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/namespace/id"
  type  = "String"
  value = lookup(local.created_namespace, var.type).id
}

resource "aws_ssm_parameter" "namespace_arn" {
  count = var.create_ssm_parameters ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/namespace/arn"
  type  = "String"
  value =  lookup(local.created_namespace, var.type).arn

}

resource "aws_ssm_parameter" "namespace_name" {
  count = var.create_ssm_parameters ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/namespace/name"
  type  = "String"
  value = var.name
}

resource "aws_ssm_parameter" "namespace_hosted_zone_id" {
  count = var.create_ssm_parameters && (try(lookup(local.created_namespace, var.type).hosted_zone, null) != null) ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/hostedzone/id"
  type  = "String"
  value = lookup(local.created_namespace, var.type).hosted_zone
}

resource "aws_ssm_parameter" "iam_read_only_policy_arn" {
  count = var.create_ssm_parameters ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/iam/policy/readonly/arn"
  type  = "String"
  value = aws_iam_policy.iam_read_only_policy.arn
}

resource "aws_ssm_parameter" "iam_read_only_role_arn" {
  count = var.create_ssm_parameters && var.create_iam_read_only_role ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/iam/role/readonly/arn"
  type  = "String"
  value = aws_iam_role.iam_read_only_role[0].arn
}

resource "aws_ssm_parameter" "iam_read_write_policy_arn" {
  count = var.create_ssm_parameters ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/iam/policy/readwrite/arn"
  type  = "String"
  value = aws_iam_policy.iam_read_write_policy.arn
}

resource "aws_ssm_parameter" "iam_read_write_role_arn" {
  count = var.create_ssm_parameters && var.create_iam_read_write_role ? 1 : 0
  name  = "${var.ssm_parameter_prefix}/cloudmap/iam/role/readwrite/arn"
  type  = "String"
  value = aws_iam_role.iam_read_write_role[0].arn
}