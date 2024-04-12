<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.42.0 |
| <a name="provider_aws.secondary"></a> [aws.secondary](#provider\_aws.secondary) | 5.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_cluster_instance.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_global_cluster.global_db_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_global_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_docdb_instance_class"></a> [docdb\_instance\_class](#input\_docdb\_instance\_class) | n/a | `string` | `"db.r5.large"` | no |
| <a name="input_docdb_password"></a> [docdb\_password](#input\_docdb\_password) | n/a | `string` | `"password"` | no |
| <a name="input_enable_global_cluster"></a> [enable\_global\_cluster](#input\_enable\_global\_cluster) | n/a | `bool` | `false` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | `string` | `"docdb"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | `"4.0.0"` | no |
| <a name="input_family"></a> [family](#input\_family) | n/a | `string` | `"docdb3.6"` | no |
| <a name="input_global_cluster_identifier"></a> [global\_cluster\_identifier](#input\_global\_cluster\_identifier) | n/a | `string` | `"global-cluster"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"docdbtest"` | no |
| <a name="input_primary_cluster_identifier"></a> [primary\_cluster\_identifier](#input\_primary\_cluster\_identifier) | n/a | `string` | `"primary-cluster"` | no |
| <a name="input_primary_instance_identifier"></a> [primary\_instance\_identifier](#input\_primary\_instance\_identifier) | n/a | `string` | `"primary-instance"` | no |
| <a name="input_primary_region"></a> [primary\_region](#input\_primary\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_secondary_cluster_identifier"></a> [secondary\_cluster\_identifier](#input\_secondary\_cluster\_identifier) | n/a | `string` | `"secondary-cluster"` | no |
| <a name="input_secondary_instance_identifier"></a> [secondary\_instance\_identifier](#input\_secondary\_instance\_identifier) | n/a | `string` | `"secondary-instance"` | no |
| <a name="input_secondary_region"></a> [secondary\_region](#input\_secondary\_region) | n/a | `string` | `"us-east-2"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_engine"></a> [engine](#output\_engine) | n/a |
| <a name="output_engine_version"></a> [engine\_version](#output\_engine\_version) | n/a |
| <a name="output_primary_instance_class"></a> [primary\_instance\_class](#output\_primary\_instance\_class) | n/a |
| <a name="output_primary_region"></a> [primary\_region](#output\_primary\_region) | n/a |
| <a name="output_secondary_region"></a> [secondary\_region](#output\_secondary\_region) | n/a |
<!-- END_TF_DOCS -->