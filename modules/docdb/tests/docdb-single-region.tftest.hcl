
#db.t3.medium
#the entire run took 22 mins
// [modules] terraform test                                                                      9:48:28  ☁  initial-commit ☂ ⚡ ✭
// tests/docdb.tftest.hcl... in progress
//   run "create_doc_db"... pass
// tests/docdb.tftest.hcl... tearing down
// tests/docdb.tftest.hcl... pass

// Success! 1 passed, 0 failed.
// [modules]                                                                                     10:12:07  ☁  initial-commit ☂ ✖ ✭


#Test Started: 22:09
#teardown: 22:19
#complete teardown 22:31
#total time: 22 mins
variables {
  docdb_instance_class        = "db.r5.large"
  family                      = "docdb5.0"
  primary_cluster_identifier  = "test-regional-cluster"
  primary_instance_identifier = "test-regional-instance"
  skip_final_snapshot         = true
}


##if enable_global_cluster = true 

run "create_doc_db_regional" {
  command = apply

  variables {

    enable_global_cluster = false
  }
}
