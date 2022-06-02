# terraform-aws-ohp-cloudmap-namespace
Repository for CloudMap namespace Terraform module

## Introduction
Terraform provides a separate resource type for each CloudMap namespace.   
The current namespace types are:
- [HTTP namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_http_namespace)
- [Private DNS namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace)
- [Public DNS namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_public_dns_namespace)

This project seeks to abstract the available namespace types into one module that lets you deploy a namespace of any type you want.

## Examples
### Create HTTP namespace
```terraform
module "namespace" {
  source = "git::github.com/ohpensource/terraform-aws-ohp-cloudmap-namespace.git" #ref=<version>
  
  type = "http"
  name = "my-namespace"
}
```
### Create private DNS namespace and SSM parameters with namespace outputs
```terraform
module "namespace" {
  source = "git::github.com/ohpensource/terraform-aws-ohp-cloudmap-namespace.git" #ref=<version>
  
  type = "private_dns"
  name = "my-dns.namespace.com"
  vpc_id = "vpc-1234567890"
  create_ssm_parameters = true
}
```
### Create public DNS namespace with read-only role for cross-account access
```terraform
module "namespace" {
  source = "git::github.com/ohpensource/terraform-aws-ohp-cloudmap-namespace.git" #ref=<version>
  
  type = "public_dns"
  name = "my-dns.namespace.com"
  create_iam_read_only_role = true
  allowed_read_only_account_ids = ["1234567890", "0987654321"]
}
```

## How-to
### Create a CloudMap namespace
To deploy a namespace of your desired type, you need to set only 2 mandatory variables:
- **type** - type of namespace - http, private_dns or public_dns
- **name** - name of your namespace

If you are deploying a **private_dns** namespace, 
do not forget to set **vpc_id** with the ID of the VPC in which the namespace should be created. 
   
By default, the following resources will be created:
- namespace of your chosen type
- read-only and read-write IAM policy for access to the namespace
- (In case of DNS namespace) Hosted zone for the namespace

### Enable SSM parameters
Want to expose the outputs of this module as SSM parameters?
Set **create_ssm_parameters** to **true**.  
Optionally construct a custom SSM parameter prefix by setting **ssm_parameter_prefix** and/or **stage** variables.

### Create cross-account IAM roles
Do you need cross-account access to your namespaces?  
Create a read-only or read-write role (or both!) with all the necessary permissions by setting **create_iam_read_only_role** or **create_iam_read_write_role**.   
Then allow cross-account access to the respective role by setting the list of allowed account IDs in **allowed_read_only_account_ids** or **allowed_read_write_account_ids** variables.

### Use the created namespace
Once your brand new namespace has been created, it's time to try it out!  
Register [services](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) and their [instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_instance) into the namespace,  
and configure your services to [discover](https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html) other services within the namespace.


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
| [aws_ssm_parameter.iam_read_only_policy_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.iam_read_only_role_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.iam_read_write_policy_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.iam_read_write_role_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.namespace_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.namespace_hosted_zone_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.namespace_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.namespace_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_read_only_account_ids"></a> [allowed\_read\_only\_account\_ids](#input\_allowed\_read\_only\_account\_ids) | List of account IDs that should be able to read from a cloudmap namespace | `list(string)` | `[]` | no |
| <a name="input_allowed_read_write_account_ids"></a> [allowed\_read\_write\_account\_ids](#input\_allowed\_read\_write\_account\_ids) | List of account IDs that should be able to update cloudmap namespace | `list(string)` | `[]` | no |
| <a name="input_create_iam_read_only_role"></a> [create\_iam\_read\_only\_role](#input\_create\_iam\_read\_only\_role) | Create namespace read-only role | `bool` | `false` | no |
| <a name="input_create_iam_read_write_role"></a> [create\_iam\_read\_write\_role](#input\_create\_iam\_read\_write\_role) | Create namespace read-write role | `bool` | `false` | no |
| <a name="input_create_ssm_parameters"></a> [create\_ssm\_parameters](#input\_create\_ssm\_parameters) | Create SSM parameters with resource output values | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Namespace description | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Namespace name | `string` | n/a | yes |
| <a name="input_ssm_parameter_prefix"></a> [ssm\_parameter\_prefix](#input\_ssm\_parameter\_prefix) | Prefix for SSM parameters. Must start with / | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Extra information about deployment of namespace, e.g. dev, tst, production | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to apply to repository | `map(any)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required) Type of namespace | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Required if private DNS namespace) VPC ID of namespace | `string` | `""` | no |

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

## Useful links
* https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html
* https://docs.aws.amazon.com/cloud-map/latest/api/Welcome.html
* https://awscli.amazonaws.com/v2/documentation/api/latest/reference/servicediscovery/index.html
* https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html
* https://blog.tinystacks.com/service-discovery-with-aws-cloud-map