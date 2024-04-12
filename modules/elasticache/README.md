<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |
| <a name="provider_aws.secondary"></a> [aws.secondary](#provider\_aws.secondary) | 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_global_replication_group.global](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_global_replication_group) | resource |
| [aws_elasticache_replication_group.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_replication_group.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_global_cluster"></a> [enable\_global\_cluster](#input\_enable\_global\_cluster) | n/a | `bool` | `true` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | `string` | `"redis"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | `"5.0.6"` | no |
| <a name="input_global_replication_group_id_suffix"></a> [global\_replication\_group\_id\_suffix](#input\_global\_replication\_group\_id\_suffix) | n/a | `string` | `"global"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | n/a | `string` | `"cache.m5.large"` | no |
| <a name="input_primary_region"></a> [primary\_region](#input\_primary\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_primary_replication_group_id"></a> [primary\_replication\_group\_id](#input\_primary\_replication\_group\_id) | n/a | `string` | `"primary-replication-group"` | no |
| <a name="input_secondary_region"></a> [secondary\_region](#input\_secondary\_region) | n/a | `string` | `"us-east-2"` | no |
| <a name="input_secondary_replication_group_id"></a> [secondary\_replication\_group\_id](#input\_secondary\_replication\_group\_id) | n/a | `string` | `"secondary-replication-group"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->