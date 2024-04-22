variables {
  db_cluster_instance_class = "db.r4.large"
  skip_final_snapshot       = true
  global_cluster_identifier = "test-global-aurora-cluster"
  engine_version            = "11.9"
}

override_resource {
  target = aws_rds_global_cluster.global_db_cluster
  values = {
    id = "testaurora123"
  }
}

override_resource {
  target = aws_rds_cluster.primary
}

override_resource {
  target = aws_rds_cluster_instance.primary
}

override_resource {
  target = aws_rds_cluster.secondary
}

override_resource {
  target = aws_rds_cluster_instance.secondary
}


run "check_regional_rds_cluster" {

  variables {
    primary_cluster_identifier  = "test-regional-cluster-aurora"
    primary_instance_identifier = "test-regional-instance-aurora"
    database_name               = "test-aurora-regional-db"
    enable_global_cluster       = false
  }

  assert {
    condition     = aws_rds_cluster.primary.cluster_identifier == "test-regional-cluster-aurora"
    error_message = "Primary cluster identifier is not as expected"

  }

  assert {
    condition     = aws_rds_cluster_instance.primary.identifier == "test-regional-instance-aurora"
    error_message = "Primary instance identifier is not as expected"

  }

}

run "check_global_rds_cluster" {

  variables {
    primary_cluster_identifier    = "test-primary-aurora-cluster"
    primary_instance_identifier   = "test-primary-aurora-instance"
    secondary_cluster_identifier  = "test-secondary-aurora-cluster"
    secondary_instance_identifier = "test-secondary-aurora-instance"
    enable_global_cluster         = true
  }

  assert {
    condition     = aws_rds_cluster.primary.cluster_identifier == "test-primary-aurora-cluster"
    error_message = "Primary cluster identifier is not as expected"

  }
  assert {
    condition     = aws_rds_cluster_instance.primary.identifier == "test-primary-aurora-instance"
    error_message = "Primary cluster identifier is not as expected"

  }

  assert {
    condition     = aws_rds_cluster_instance.secondary[0].identifier == "test-secondary-aurora-instance"
    error_message = "Secondary instance identifier is not as expected"

  }

  assert {
    condition     = aws_rds_cluster.secondary[0].cluster_identifier == "test-secondary-aurora-cluster"
    error_message = "Secondary cluster identifier is not as expected"

  }

  assert {
    condition     = aws_rds_global_cluster.global_db_cluster[0].global_cluster_identifier == "test-global-aurora-cluster"
    error_message = "Global Cluster identifier is not as expected"

  }

  assert {
    condition     = (aws_rds_cluster.primary.global_cluster_identifier == aws_rds_cluster.secondary[0].global_cluster_identifier) == true
    error_message = "Primary and Secondary do not belong to the same global cluster"
  }

}



run "check_instance_class_is_valid_primary" {

  command = plan

  module {
    source = "./tests/load"
  }

  variables {
    engine                    = run.check_global_rds_cluster.engine
    db_cluster_instance_class = run.check_global_rds_cluster.primary_instance_class
    region                    = run.check_global_rds_cluster.primary_region
    engine_version            = run.check_global_rds_cluster.engine_version
  }

}

run "check_instance_class_is_valid_secondary" {

  command = plan

  module {
    source = "./tests/load"
  }

  variables {
    engine                    = run.check_global_rds_cluster.engine
    db_cluster_instance_class = run.check_global_rds_cluster.primary_instance_class
    region                    = run.check_global_rds_cluster.secondary_region
    engine_version            = run.check_global_rds_cluster.engine_version
  }

}

