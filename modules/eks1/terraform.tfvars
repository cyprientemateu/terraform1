aws_region = "us-east-1"

eks_name = ""

eks_version = 1.29

endpoint_public_access = true

endpoint_private_access = false

endpoint_public_access_cidrs = ["0.0.0.0/0"]

shared_owned              = "shared"
enable_cluster_autoscaler = "true"
control_plane_name        = "1119-dev-a1"

tags = {
  "id"             = "1119"
  "owner"          = "tcc"
  "teams"          = "Devops"
  "environment"    = "dev"
  "project"        = "a1"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}