variable "tags" {
  type        = map(any)
  description = "Common tags to be applied to resources"
  default = {
    "id"             = "1119"
    "owner"          = "tcc"
    "teams"          = "Devops"
    "environment"    = "development"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "aws_region" {
  type = string
}

variable "eks_version" {
  type = number
}

variable "endpoint_private_access" {
  type = bool
}

variable "endpoint_public_access" {
  type = bool
}