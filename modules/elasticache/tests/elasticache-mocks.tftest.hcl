#This test takes ~14 mins to run
// [elasticache] terraform test                                                                  14:15:25  ☁  initial-commit ☂ ✖ ✭
// tests/elasticache.tftest.hcl... in progress
//   run "create_elasticache_redis"... pass
// tests/elasticache.tftest.hcl... tearing down
// tests/elasticache.tftest.hcl... pass

// Success! 1 passed, 0 failed.
// [elasticache]                                                                                 14:29:19  ☁ 

override_resource {
  target = aws_elasticache_global_replication_group.global
  values = {
    global_replication_group_id = "testredisglobalid"
  }
}

override_resource {
  target = aws_elasticache_replication_group.primary
  values = {
    id = "primaryid"
  }
}

override_resource {
  target = aws_elasticache_replication_group.secondary
}

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
    enable_global_cluster        = true
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