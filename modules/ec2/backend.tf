# terraform {
#   backend "s3" {
#     bucket         = "1119-a1-main-backend"
#     dynamodb_table = "dynamodb-tcc-1119"
#     key            = "TCC/ec2/terraform.tfstate"
#     region         = "us-east-1"
#     # encrypt        = true
#   }
# }