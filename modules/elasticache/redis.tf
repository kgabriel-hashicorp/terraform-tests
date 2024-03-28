provider "aws" {
  region = var.primary_region
}

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}

resource "aws_elasticache_replication_group" "primary" {
  replication_group_id = var.primary_replication_group_id
  description          = "primary replication group"

  engine         = var.engine
  engine_version = var.engine_version
  node_type      = var.node_type

  num_cache_clusters = 1
}

resource "aws_elasticache_global_replication_group" "global" {
  count                              = var.enable_global_cluster ? 1 : 0
  global_replication_group_id_suffix = var.global_replication_group_id_suffix
  primary_replication_group_id       = aws_elasticache_replication_group.primary.id
}

resource "aws_elasticache_replication_group" "secondary" {
  count = var.enable_global_cluster ? 1 : 0

  provider                    = aws.secondary
  replication_group_id        = var.secondary_replication_group_id
  description                 = "secondary replication group"
  global_replication_group_id = aws_elasticache_global_replication_group.global[0].global_replication_group_id

  num_cache_clusters = 1
}


#create: 10:28:58
#complete: 10:54:05

#destroy: 11:09:00
#complete 11:23