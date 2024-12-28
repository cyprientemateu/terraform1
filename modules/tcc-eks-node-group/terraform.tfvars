aws_region = "us-east-1"

control_plane_name = "1119-dev-a1-control-plane"
eks_version        = "1.29"
node_min           = "1"
desired_node       = "2"
node_max           = "3"

blue_node_color  = "blue"
green_node_color = "green"

blue  = false
green = true

ec2_ssh_key               = "terraform"
deployment_nodegroup      = "blue_green"
capacity_type             = "ON_DEMAND"
ami_type                  = "AL2_x86_64"
instance_types            = "t2.micro"
disk_size                 = "10"
shared_owned              = "shared"
enable_cluster_autoscaler = "true"

tags = {
  "id"             = "1119"
  "owner"          = "tcc"
  "teams"          = "Devops"
  "environment"    = "dev"
  "project"        = "a1"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}