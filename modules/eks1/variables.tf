variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "eks_name" {
  type    = string
  default = ""
}

variable "eks_version" {
  type    = number
  default = 1.26
}

variable "endpoint_private_access" {
  type = bool
}

variable "endpoint_public_access" {
  type = bool
}

variable "endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}


variable "tags" {
  type = map(any)
  default = {
    "id"             = "1119"
    "owner"          = "TCC"
    "teams"          = "Devops"
    "environment"    = "development"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

# variable "public_subnet_ids" {
#   type    = list(string)
#   default = [""]

# }

# variable "private_subnet_ids" {
#   type    = list(string)
#   default = [""]
#   # default = ["aws_subnet.private_1", "aws_subnet.private_2"]
# }

# variable "config" {
#   type = map(any)
#   default = {
#     "ami_type"       = "AL2_x86_64"
#     "capacity_type"  = "ON_DEMAND"
#     "disk_size"      = 20
#     "instance_types" = ["t3.medium"]
#   }
# }

# Assuming you already have subnet IDs, you can define them as variables
variable "public_subnet_ids" {
  type = list(string)
  default = [
    "subnet-02e286c9bdfb33f0b",
    "subnet-011cf4a50c2518de6"
  ]
  description = "list of public subnet IDs"
}

variable "private_subnet_ids" {
  type = list(string)
  default = [
    "subnet-0ea4e8e55f5a0e015",
    "subnet-001b7fd7aab3aec52"
  ]
  description = "list of private subnet IDs"
}