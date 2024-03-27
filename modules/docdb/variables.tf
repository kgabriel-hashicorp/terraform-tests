variable "name" {
  default = "docdbtest"
}

variable "docdb_instance_class" {
  default = "db.r5.large"
}

variable "family" {
  default = "docdb3.6"

}

variable "docdb_password" {
  default   = "password"
  sensitive = true
}

variable "enable_global_cluster" {
  type    = bool
  default = false
}

variable "global_cluster_identifier" {
  default = "global-cluster"
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

variable "skip_final_snapshot" {
  default = false
}

variable "primary_region" {
  default = "us-east-1"
}

variable "secondary_region" {
  default = "us-east-2"
}

variable "engine" {
  default = "docdb"
}

variable "engine_version" {
  default = "4.0.0"
}