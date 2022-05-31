# terraform-aws-ohp-cloudmap-namespace
Repository for CloudMap namespace Terraform module

## Usage
TODO

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.iam_read_only_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.iam_read_write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.iam_read_only_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.iam_read_write_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_service_discovery_http_namespace.namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_http_namespace) | resource |
| [aws_service_discovery_private_dns_namespace.namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [aws_service_discovery_public_dns_namespace.namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_public_dns_namespace) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_read_only_account_ids"></a> [allowed\_read\_only\_account\_ids](#input\_allowed\_read\_only\_account\_ids) | List of account IDs that should be able to read from a cloudmap namespace | `list(string)` | `[]` | no |
| <a name="input_allowed_read_write_account_ids"></a> [allowed\_read\_write\_account\_ids](#input\_allowed\_read\_write\_account\_ids) | List of account IDs that should be able to update cloudmap namespace | `list(string)` | `[]` | no |
| <a name="input_create_iam_read_only_role"></a> [create\_iam\_read\_only\_role](#input\_create\_iam\_read\_only\_role) | Create namespace read-only role | `bool` | `false` | no |
| <a name="input_create_iam_read_write_role"></a> [create\_iam\_read\_write\_role](#input\_create\_iam\_read\_write\_role) | Create namespace read-write role | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Namespace description | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Namespace name | `string` | n/a | yes |
| <a name="input_namespace_type"></a> [namespace\_type](#input\_namespace\_type) | (Required) Type of namespace | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to apply to repository | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID of namespace (necessary if private DNS namespace) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_read_only_policy_arn"></a> [iam\_read\_only\_policy\_arn](#output\_iam\_read\_only\_policy\_arn) | n/a |
| <a name="output_iam_read_only_role_arn"></a> [iam\_read\_only\_role\_arn](#output\_iam\_read\_only\_role\_arn) | n/a |
| <a name="output_iam_read_write_policy_arn"></a> [iam\_read\_write\_policy\_arn](#output\_iam\_read\_write\_policy\_arn) | n/a |
| <a name="output_iam_read_write_role_arn"></a> [iam\_read\_write\_role\_arn](#output\_iam\_read\_write\_role\_arn) | n/a |
| <a name="output_namespace_arn"></a> [namespace\_arn](#output\_namespace\_arn) | n/a |
| <a name="output_namespace_hosted_zone_id"></a> [namespace\_hosted\_zone\_id](#output\_namespace\_hosted\_zone\_id) | n/a |
| <a name="output_namespace_id"></a> [namespace\_id](#output\_namespace\_id) | n/a |
| <a name="output_namespace_name"></a> [namespace\_name](#output\_namespace\_name) | n/a |
<!-- END_TF_DOCS -->
