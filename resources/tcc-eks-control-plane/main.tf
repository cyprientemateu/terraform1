provider "aws" {
  region = local.aws_region
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "main-backend-tcc-1119"
    dynamodb_table = "dynamodb-tcc-1119"
    key            = "terraform1/tcc-eks-control-plane/terraform.tfstate"
    region         = "us-east-1"
  }
}

locals {
  aws_region              = "us-east-1"
  eks_version             = "1.28"
  endpoint_private_access = false
  endpoint_public_access  = true

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

module "eks-control-plane" {
  source                  = "../../modules/tcc-eks-control-plane"
  aws_region              = local.aws_region
  eks_version             = local.eks_version
  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
  tags                    = local.tags
}