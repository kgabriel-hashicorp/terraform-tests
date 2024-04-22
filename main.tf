terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      # Setting the provider version is a strongly recommended practice
      # version = "..."
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
  # Provider functions require Terraform 1.8 and later.
  required_version = ">= 1.8.0"
}

provider "aws" {
  region = "us-east-1"
}



data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

output "example" {
  value = provider::aws::arn_parse(aws_instance.web.arn)
}

locals {
  manifest = {
    apiVersion = "v1"
    kind       = "ConfigMap"
    metadata = {
      name = "example"
    }
    data = {
      EXAMPLE = "example"
    }
  }
}

output "example_output" {
  value = provider::kubernetes::manifest_encode(local.manifest)
}
