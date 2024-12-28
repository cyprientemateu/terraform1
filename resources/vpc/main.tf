terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

# terraform {
#   backend "s3" {
#     bucket         = "main-backend-tcc-1119"
#     dynamodb_table = "dynamodb-tcc-1119"
#     key            = "terraform1/vpc/terraform.tfstate"
#     region         = "us-east-1"
#   }
# }

locals {
  aws_region           = "us-east-1"
  cluster_name         = "1119-dev-a1-control-plane"
  vpc_cidr             = "10.0.0.0/16"
  nat_number           = "1"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]

  tags = {
    "id"             = "1119"
    "owner"          = "tcc"
    "teams"          = "Devops"
    "environment"    = "dev"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "vpc" {
  source               = "../../modules/vpc"
  aws_region           = local.aws_region
  vpc_cidr             = local.vpc_cidr
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
  availability_zones   = local.availability_zones
  cluster_name         = local.cluster_name
  nat_number           = local.nat_number
  tags                 = local.tags
}