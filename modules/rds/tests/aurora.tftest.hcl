// [aurora] terraform test                                                                       15:31:41  ☁  initial-commit ☂ ✖ ✭
// tests/aurora.tftest.hcl... in progress
//   run "aurora_test"... pass
// tests/aurora.tftest.hcl... tearing down
// tests/aurora.tftest.hcl... pass

// Success! 1 passed, 0 failed.
// [aurora]       


# This test takes approximatel ~5 mins to run
run "aurora_test" {
  command = apply

  variables {
    cluster_identifier  = "test-cluster"
    skip_final_snapshot = true
  }
}