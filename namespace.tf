resource "aws_service_discovery_http_namespace" "namespace" {
  count = var.type == "http" ? 1 : 0
  name = var.name
  description = local.description
  tags = local.baseline_tags
}

resource "aws_service_discovery_private_dns_namespace" "namespace" {
  count = var.type == "private_dns" ? 1 : 0
  name = var.name
  description = local.description
  tags = local.baseline_tags
  vpc = var.vpc_id
}

resource "aws_service_discovery_public_dns_namespace" "namespace" {
  count = var.type == "public_dns" ? 1 : 0
  name = var.name
  description = local.description
  tags = local.baseline_tags
}
