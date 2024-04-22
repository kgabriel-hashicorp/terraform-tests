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
| [aws_rds_cluster.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_instance.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_global_cluster.global_db_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_global_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | n/a | `string` | `"demo-cluster"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | n/a | `string` | `"global-cluster-aurora-db"` | no |
| <a name="input_db_cluster_instance_class"></a> [db\_cluster\_instance\_class](#input\_db\_cluster\_instance\_class) | n/a | `string` | `"db.r4.large"` | no |
| <a name="input_enable_global_cluster"></a> [enable\_global\_cluster](#input\_enable\_global\_cluster) | n/a | `bool` | `false` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | `string` | `"aurora-postgresql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `number` | `11.9` | no |
| <a name="input_global_cluster_identifier"></a> [global\_cluster\_identifier](#input\_global\_cluster\_identifier) | n/a | `string` | `"global-cluster-aurora"` | no |
| <a name="input_primary_cluster_identifier"></a> [primary\_cluster\_identifier](#input\_primary\_cluster\_identifier) | n/a | `string` | `"primary-cluster"` | no |
| <a name="input_primary_instance_identifier"></a> [primary\_instance\_identifier](#input\_primary\_instance\_identifier) | n/a | `string` | `"primary-instance"` | no |
| <a name="input_primary_region"></a> [primary\_region](#input\_primary\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_secondary_cluster_identifier"></a> [secondary\_cluster\_identifier](#input\_secondary\_cluster\_identifier) | n/a | `string` | `"secondary-cluster"` | no |
| <a name="input_secondary_instance_identifier"></a> [secondary\_instance\_identifier](#input\_secondary\_instance\_identifier) | n/a | `string` | `"secondary-instance"` | no |
| <a name="input_secondary_region"></a> [secondary\_region](#input\_secondary\_region) | n/a | `string` | `"us-west-2"` | no |
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