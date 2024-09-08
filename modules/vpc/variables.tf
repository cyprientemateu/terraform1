variable "aws_region" {
  type = string
}
variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block. Example: 10.0.0.0/16"
}
variable "cluster_name" {
  type    = string
  default = "1119-dev-a1"
}
variable "nat_number" {
  type    = number
  default = 1
}
variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
variable "availability_zones" {
  type = list(string)
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1119"
    "owner"          = "tcc"
    "teams"          = "Devops"
    "environment"    = "production"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
