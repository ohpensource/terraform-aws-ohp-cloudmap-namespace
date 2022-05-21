locals {
  created_namespace = {
    http = one(aws_service_discovery_http_namespace.namespace)
    private_dns = one(aws_service_discovery_private_dns_namespace.namespace)
    public_dns = one(aws_service_discovery_public_dns_namespace.namespace)
  }
}

locals {
  iam_read_only_principals = length(var.allowed_read_only_account_ids) > 0 ? [for account_id in var.allowed_read_only_account_ids : "arn:aws:iam::${account_id}:root"] : ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
  iam_read_only_http_actions = [
    "servicediscovery:DiscoverInstances",
    "servicediscovery:GetInstance",
    "servicediscovery:GetInstancesHealthStatus",
    "servicediscovery:GetNamespace",
    "servicediscovery:GetOperation",
    "servicediscovery:GetService",
    "servicediscovery:ListInstances",
    "servicediscovery:ListNamespaces",
    "servicediscovery:ListOperations",
    "servicediscovery:ListServices",
    "servicediscovery:ListTagsForResource"
  ]
  iam_read_only_dns_actions = [
    "route53:GetHealthCheck"
  ]
  iam_read_only_actions = concat(
    local.iam_read_only_http_actions,
    var.namespace_type == "private_dns" || var.namespace_type == "public_dns" ? local.iam_read_only_dns_actions : []
  )
}

locals {
  iam_read_write_principals = length(var.allowed_read_write_account_ids) > 0 ? [for account_id in var.allowed_read_write_account_ids : "arn:aws:iam::${account_id}:root"] : ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
  iam_read_write_http_actions = [
    "ec2:DescribeInstances",
    "servicediscovery:CreateService",
    "servicediscovery:DeleteService",
    "servicediscovery:DeregisterInstance",
    "servicediscovery:DiscoverInstances",
    "servicediscovery:GetInstance",
    "servicediscovery:GetInstancesHealthStatus",
    "servicediscovery:GetNamespace",
    "servicediscovery:GetOperation",
    "servicediscovery:GetService",
    "servicediscovery:ListInstances",
    "servicediscovery:ListNamespaces",
    "servicediscovery:ListOperations",
    "servicediscovery:ListServices",
    "servicediscovery:ListTagsForResource",
    "servicediscovery:RegisterInstance",
    "servicediscovery:TagResource",
    "servicediscovery:UntagResource",
    "servicediscovery:UpdateInstanceCustomHealthStatus",
    "servicediscovery:UpdateService"
  ]
  iam_read_write_dns_actions = [
    "route53:ChangeResourceRecordSets",
    "route53:CreateHealthCheck",
    "route53:DeleteHealthCheck",
    "route53:GetHealthCheck",
    "route53:UpdateHealthCheck"
  ]
  iam_read_write_actions = concat(
    local.iam_read_write_http_actions,
    var.namespace_type == "private_dns" || var.namespace_type == "public_dns" ? local.iam_read_write_dns_actions : []
  )
}