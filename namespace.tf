resource "aws_service_discovery_http_namespace" "namespace" {
  count = var.namespace_type == "http" ? 1 : 0
  name = var.name
  description = local.description
  tags = var.tags
}

resource "aws_service_discovery_private_dns_namespace" "namespace" {
  count = var.namespace_type == "private_dns" ? 1 : 0
  name = var.name
  description = local.description
  tags = var.tags
  vpc = var.vpc_id
}

resource "aws_service_discovery_public_dns_namespace" "namespace" {
  count = var.namespace_type == "public_dns" ? 1 : 0
  name = var.name
  description = local.description
  tags = var.tags
}
