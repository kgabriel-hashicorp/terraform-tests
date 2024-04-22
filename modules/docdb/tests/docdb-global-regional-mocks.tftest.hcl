variables {
  skip_final_snapshot       = true
  global_cluster_identifier = "test-global-cluster"
}

override_resource {
  target = aws_docdb_cluster.primary
}

override_resource {
  target = aws_docdb_cluster_instance.primary
}

override_resource {
  target = aws_docdb_cluster.secondary
}

override_resource {
  target = aws_docdb_cluster_instance.secondary
}

override_resource {
  target = aws_docdb_global_cluster.global_db_cluster
  values = {
    id = "test123id"
  }
}

run "check_regional_docdb_cluster" {

  variables {
    primary_cluster_identifier  = "test-regional-cluster"
    primary_instance_identifier = "test-regional-instance"
    enable_global_cluster       = false
  }

  assert {
    condition     = aws_docdb_cluster.primary.cluster_identifier == "test-regional-cluster"
    error_message = "Primary cluster identifier is not as expected"

  }

  assert {
    condition     = aws_docdb_cluster_instance.primary.identifier == "test-regional-instance"
    error_message = "Primary instance identifier is not as expected"

  }

}

run "check_global_docdb_cluster" {

  variables {
    primary_cluster_identifier    = "test-primary-cluster"
    primary_instance_identifier   = "test-primary-instance"
    secondary_cluster_identifier  = "test-secondary-cluster"
    secondary_instance_identifier = "test-secondary-instance"
    enable_global_cluster         = true
  }

  assert {
    condition     = aws_docdb_cluster.primary.cluster_identifier == "test-primary-cluster"
    error_message = "Primary cluster identifier is not as expected"

  }
  assert {
    condition     = aws_docdb_cluster_instance.primary.identifier == "test-primary-instance"
    error_message = "Primary cluster identifier is not as expected"

  }

  assert {
    condition     = aws_docdb_cluster_instance.secondary[0].identifier == "test-secondary-instance"
    error_message = "Secondary instance identifier is not as expected"

  }

  assert {
    condition     = aws_docdb_cluster.secondary[0].cluster_identifier == "test-secondary-cluster"
    error_message = "Secondary cluster identifier is not as expected"

  }

  assert {
    condition     = aws_docdb_global_cluster.global_db_cluster[0].global_cluster_identifier == "test-global-cluster"
    error_message = "Global Cluster identifier is not as expected"

  }

  assert {
    condition     = (aws_docdb_cluster.primary.global_cluster_identifier == aws_docdb_cluster.secondary[0].global_cluster_identifier) == true
    error_message = "Primary and Secondary do not belong to the same global cluster"
  }

}

run "check_instance_class_is_valid_primary" {

  command = plan

  module {
    source = "./tests/load"
  }

  variables {
    engine               = run.check_global_docdb_cluster.engine
    docdb_instance_class = run.check_global_docdb_cluster.primary_instance_class
    region               = run.check_global_docdb_cluster.primary_region
    engine_version       = run.check_global_docdb_cluster.engine_version
  }

}

run "check_instance_class_is_valid_secondary" {

  command = plan

  module {
    source = "./tests/load"
  }

  variables {
    engine               = run.check_global_docdb_cluster.engine
    docdb_instance_class = run.check_global_docdb_cluster.primary_instance_class
    region               = run.check_global_docdb_cluster.secondary_region
    engine_version       = run.check_global_docdb_cluster.engine_version
  }

}


