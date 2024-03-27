run "load_plan" {

      variables {
    // db_cluster_instance_class        = "db.r5foo.large"
    primary_cluster_identifier  = "test-regional-aurora-cluster"
    primary_instance_identifier = "test-regional-aurora-instance"
    enable_global_cluster       = false
    // engine_version              = "4.0.0"
    
  }
    command = plan
    assert {
        condition     = aws_rds_cluster_instance.primary.identifier == "test-regional-aurora-instance"
        error_message = "Primary cluster identifier is not as expected"

    }
    
}

run "check_instance_class_is_valid_primary" {

    command = plan

    module {
        source = "./tests/load"
    }

    variables {
        engine = run.load_plan.engine
        db_cluster_instance_class = run.load_plan.primary_instance_class
        region = run.load_plan.secondary_region
        engine_version = run.load_plan.engine_version
    }

}

