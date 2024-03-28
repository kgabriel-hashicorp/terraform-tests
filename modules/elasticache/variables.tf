variable "primary_region" {
  default = "us-east-1"
}

variable "secondary_region" {
  default = "us-east-2"
}

variable "node_type" {
  default = "cache.m5.large"

}

variable "engine" {
  default = "redis"
}

variable "engine_version" {
  default = "5.0.6"
}

variable "enable_global_cluster" {
  type    = bool
  default = true
}

variable "global_replication_group_id_suffix" {
  default = "global"
}

variable "primary_replication_group_id" {
  default = "primary-replication-group"
}

variable "secondary_replication_group_id" {
  default = "secondary-replication-group"
}
