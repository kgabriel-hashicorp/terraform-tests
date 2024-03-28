#This test takes ~14 mins to run
// [elasticache] terraform test                                                                  14:15:25  ☁  initial-commit ☂ ✖ ✭
// tests/elasticache.tftest.hcl... in progress
//   run "create_elasticache_redis"... pass
// tests/elasticache.tftest.hcl... tearing down
// tests/elasticache.tftest.hcl... pass

// Success! 1 passed, 0 failed.
// [elasticache]                                                                                 14:29:19  ☁ 


run "create_elasticache_regional" {
  command = plan
  variables {
    node_type                    = "cache.t3.micro"
    enable_global_cluster        = false
    primary_replication_group_id = "test-regional-id"
  }

  assert {
    condition     = aws_elasticache_replication_group.primary.replication_group_id == "test-regional-id"
    error_message = "Primary Replication Group not created"
  }

}

run "create_elasticache_global" {

  variables {
    enable_global_cluster = true
    primary_replication_group_id = "test-primary-global-replication-group"
  }

  assert {
    condition     = (aws_elasticache_replication_group.primary.id == aws_elasticache_global_replication_group.global[0].primary_replication_group_id) == true
    error_message = "Global is using the wrong primary replication group"
  }

    assert {
    condition     = (aws_elasticache_replication_group.secondary[0].global_replication_group_id == aws_elasticache_global_replication_group.global[0].global_replication_group_id) == true
    error_message = "Secondary is not using the correct global replication group"
  }
}

#start global 11:49
#ends global 12:27:51
#regional#
# aws_elasticache_replication_group.primary will be created
  // + resource "aws_elasticache_replication_group" "primary" {
  //     + apply_immediately              = (known after apply)
  //     + arn                            = (known after apply)
  //     + at_rest_encryption_enabled     = (known after apply)
  //     + auth_token_update_strategy     = "ROTATE"
  //     + auto_minor_version_upgrade     = (known after apply)
  //     + automatic_failover_enabled     = false
  //     + cluster_enabled                = (known after apply)
  //     + configuration_endpoint_address = (known after apply)
  //     + data_tiering_enabled           = (known after apply)
  //     + description                    = "primary replication group"
  //     + engine                         = "redis"
  //     + engine_version                 = "5.0.6"
  //     + engine_version_actual          = (known after apply)
  //     + global_replication_group_id    = (known after apply)
  //     + id                             = (known after apply)
  //     + ip_discovery                   = (known after apply)
  //     + maintenance_window             = (known after apply)
  //     + member_clusters                = (known after apply)
  //     + multi_az_enabled               = false
  //     + network_type                   = (known after apply)
  //     + node_type                      = "cache.t3.micro"
  //     + num_cache_clusters             = 1
  //     + num_node_groups                = (known after apply)
  //     + parameter_group_name           = (known after apply)
  //     + primary_endpoint_address       = (known after apply)
  //     + reader_endpoint_address        = (known after apply)
  //     + replicas_per_node_group        = (known after apply)
  //     + replication_group_id           = "test-regional-id"
  //     + security_group_ids             = (known after apply)
  //     + security_group_names           = (known after apply)
  //     + snapshot_window                = (known after apply)
  //     + subnet_group_name              = (known after apply)
  //     + tags_all                       = (known after apply)
  //     + transit_encryption_enabled     = (known after apply)
  //   }


//  run "create_elasticache_global"... pass

// # aws_elasticache_global_replication_group.global[0]:
// resource "aws_elasticache_global_replication_group" "global" {
//     arn                                  = "arn:aws:elasticache::550664535260:globalreplicationgroup:ldgnf-global"
//     at_rest_encryption_enabled           = false
//     auth_token_enabled                   = false
//     automatic_failover_enabled           = false
//     cache_node_type                      = "cache.m5.large"
//     cluster_enabled                      = false
//     engine                               = "redis"
//     engine_version                       = "5.0.6"
//     engine_version_actual                = "5.0.6"
//     global_node_groups                   = []
//     global_replication_group_description = " "
//     global_replication_group_id          = "ldgnf-global"
//     global_replication_group_id_suffix   = "global"
//     id                                   = "ldgnf-global"
//     num_node_groups                      = 0
//     primary_replication_group_id         = "test-primary-global-replication-group"
//     transit_encryption_enabled           = false
// }

// # aws_elasticache_replication_group.primary:
// resource "aws_elasticache_replication_group" "primary" {
//     arn                        = "arn:aws:elasticache:us-east-1:550664535260:replicationgroup:test-primary-global-replication-group"
//     at_rest_encryption_enabled = false
//     auth_token_update_strategy = "ROTATE"
//     auto_minor_version_upgrade = "true"
//     automatic_failover_enabled = false
//     cluster_enabled            = false
//     data_tiering_enabled       = false
//     description                = "primary replication group"
//     engine                     = "redis"
//     engine_version             = "5.0.6"
//     engine_version_actual      = "5.0.6"
//     id                         = "test-primary-global-replication-group"
//     ip_discovery               = "ipv4"
//     maintenance_window         = "tue:05:00-tue:06:00"
//     member_clusters            = [
//         "test-primary-global-replication-group-001",
//     ]
//     multi_az_enabled           = false
//     network_type               = "ipv4"
//     node_type                  = "cache.m5.large"
//     num_cache_clusters         = 1
//     num_node_groups            = 1
//     parameter_group_name       = "default.redis5.0"
//     port                       = 6379
//     primary_endpoint_address   = "test-primary-global-replication-group.pqytvg.ng.0001.use1.cache.amazonaws.com"
//     reader_endpoint_address    = "test-primary-global-replication-group-ro.pqytvg.ng.0001.use1.cache.amazonaws.com"
//     replicas_per_node_group    = 0
//     replication_group_id       = "test-primary-global-replication-group"
//     security_group_ids         = []
//     security_group_names       = []
//     snapshot_retention_limit   = 0
//     snapshot_window            = "09:00-10:00"
//     subnet_group_name          = "default"
//     tags_all                   = {}
//     transit_encryption_enabled = false
// }

// # aws_elasticache_replication_group.secondary[0]:
// resource "aws_elasticache_replication_group" "secondary" {
//     arn                         = "arn:aws:elasticache:us-east-2:550664535260:replicationgroup:secondary-replication-group"
//     at_rest_encryption_enabled  = false
//     auth_token_update_strategy  = "ROTATE"
//     auto_minor_version_upgrade  = "false"
//     automatic_failover_enabled  = false
//     cluster_enabled             = false
//     data_tiering_enabled        = false
//     description                 = "secondary replication group"
//     engine                      = "redis"
//     engine_version              = "5.0.6"
//     engine_version_actual       = "5.0.6"
//     global_replication_group_id = "ldgnf-global"
//     id                          = "secondary-replication-group"
//     ip_discovery                = "ipv4"
//     maintenance_window          = "tue:05:30-tue:06:30"
//     member_clusters             = [
//         "secondary-replication-group-001",
//     ]
//     multi_az_enabled            = false
//     network_type                = "ipv4"
//     node_type                   = "cache.m5.large"
//     num_cache_clusters          = 1
//     num_node_groups             = 1
//     parameter_group_name        = "global-datastore-secondary-replication-groupqfia"
//     port                        = 6379
//     primary_endpoint_address    = "secondary-replication-group.hgicrk.ng.0001.use2.cache.amazonaws.com"
//     reader_endpoint_address     = "secondary-replication-group-ro.hgicrk.ng.0001.use2.cache.amazonaws.com"
//     replicas_per_node_group     = 0
//     replication_group_id        = "secondary-replication-group"
//     security_group_ids          = []
//     security_group_names        = []
//     snapshot_retention_limit    = 0
//     snapshot_window             = "04:30-05:30"
//     subnet_group_name           = "default"
//     tags_all                    = {}
//     transit_encryption_enabled  = false
// }