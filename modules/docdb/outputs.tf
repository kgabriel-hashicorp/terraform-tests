output "engine" {
  value = aws_docdb_cluster.primary.engine
}

output "engine_version" {
  value = aws_docdb_cluster.primary.engine_version
}
output "primary_instance_class" {
  value = aws_docdb_cluster_instance.primary.instance_class
}

output "primary_region" {
  value = "us-east-1"
}

output "secondary_region" {
  value = "us-west-2"
}