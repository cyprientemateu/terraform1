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
  default = 1.28
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
  }
}

variable "public_subnet_ids" {
  type    = list(string)
  default = [""]
}

variable "private_subnet_ids" {
  type    = list(string)
  default = [""]
  # default = ["aws_subnet.private_1", "aws_subnet.private_2"]
}

variable "shared_owned" {
  type        = string
  description = "Valid values are shared or owned"
}

variable "enable_cluster_autoscaler" {
  type        = string
  description = "Valid values are true or false"
}

variable "control_plane_name" {
  type = string
}