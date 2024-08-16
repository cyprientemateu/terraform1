# # Import the existing VPC into Terraform state
# data "aws_vpc" "existing_vpc" {
#   id = "vpc-0dbb8d4910c3497fd"
# }

# # Delete the VPC
# resource "aws_vpc" "existing_vpc" {
#   #   count = length(data.aws_vpc.existing_vpc.ids)
#   id = data.aws_vpc.existing_vpc.id
#   # this is used when deleting multiple vpc's  
#   #   id = data.aws_vpc.existing_vpc.ids[count.index]
#   # Add any other attributes you want to specify for the VPC deletion
#   # e.g., deletion_protection = false
# }
