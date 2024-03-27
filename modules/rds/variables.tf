variable "database_name" {
  default = "global-cluster-aurora-db"

}
variable "db_cluster_instance_class" {
  default = "db.r4.large"
}

variable "engine" {
  default = "aurora-postgresql"
}

variable "engine_version" {
  default = 11.9
}

variable "cluster_identifier" {
  default = "demo-cluster"
}

variable "enable_global_cluster" {
  default = false
}

variable "skip_final_snapshot" {
  default = false
}

variable "global_cluster_identifier" {
  default = "global-cluster-aurora"
}

variable "primary_cluster_identifier" {
  default = "primary-cluster"
}

variable "primary_instance_identifier" {
  default = "primary-instance"
}

variable "secondary_cluster_identifier" {
  default = "secondary-cluster"
}

variable "secondary_instance_identifier" {
  default = "secondary-instance"
}

variable "primary_region" {
  default = "us-east-1"
}

variable "secondary_region" {
  default = "us-west-2"
}