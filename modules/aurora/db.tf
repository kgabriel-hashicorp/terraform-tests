terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.primary_region
}

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}

resource "aws_rds_global_cluster" "global_db_cluster" {
  count                     = var.enable_global_cluster ? 1 : 0
  global_cluster_identifier = var.global_cluster_identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  database_name             = var.database_name
}

resource "aws_rds_cluster" "primary" {
  engine                    = var.engine
  engine_version            = var.engine_version
  cluster_identifier        = var.primary_cluster_identifier
  master_username           = "username"
  master_password           = "somepass123"
  database_name             = var.database_name
  global_cluster_identifier = var.enable_global_cluster ? aws_rds_global_cluster.global_db_cluster[0].id : null
  db_subnet_group_name      = "default"
  skip_final_snapshot       = var.skip_final_snapshot
}

resource "aws_rds_cluster_instance" "primary" {
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = var.primary_instance_identifier
  cluster_identifier   = aws_rds_cluster.primary.id
  instance_class       = var.db_cluster_instance_class
  db_subnet_group_name = "default"
}

resource "aws_rds_cluster" "secondary" {
  count                     = var.enable_global_cluster ? 1 : 0
  provider                  = aws.secondary
  engine                    = var.engine
  engine_version            = var.engine_version
  cluster_identifier        = var.secondary_cluster_identifier
  global_cluster_identifier = aws_rds_global_cluster.global_db_cluster[count.index].id
  skip_final_snapshot       = var.skip_final_snapshot

  depends_on = [
    aws_rds_cluster_instance.primary
  ]
}

resource "aws_rds_cluster_instance" "secondary" {
  count                = var.enable_global_cluster ? 1 : 0
  provider             = aws.secondary
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = var.secondary_instance_identifier
  cluster_identifier   = aws_rds_cluster.secondary[count.index].id
  instance_class       = "db.r4.large"
  db_subnet_group_name = "default"
}