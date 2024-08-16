data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-vpc"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:project"
    values = ["a1"]
  }
}

# data "aws_subnet" "private" {
#   filter {
#     name = "tag:Name"
#     values = [
#       "tcc-vpc-private-subnet-1",
#       "tcc-vpc-private-subnet-2",
#       "tcc-vpc-private-subnet-3"
#     ]
#   }
#   filter {
#     name   = "cidr-block"
#     values = ["10.0.4.0/24"] # Example CIDR block
#   }
# }

# data "aws_subnet" "public" {
#   filter {
#     name = "tag:Name"
#     values = [
#       "tcc-vpc-public-subnet-1",
#       "tcc-vpc-public-subnet-2",
#       "tcc-vpc-public-subnet-3"
#     ]
#   }
#   filter {
#     name   = "cidr-block"
#     values = ["10.0.1.0/24"] # Example CIDR block
#   }
# }
data "aws_subnet" "public-01" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-public-subnet-1-us-east-1a"]
  }
}

data "aws_subnet" "public-02" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-public-subnet-2-us-east-1b"]
  }
}

data "aws_subnet" "public-03" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-public-subnet-3-us-east-1c"]
  }
}

data "aws_subnet" "private-01" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-private-subnet-1-us-east-1a"]
  }
}

data "aws_subnet" "private-02" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-private-subnet-2-us-east-1b"]
  }
}

data "aws_subnet" "private-03" {
  filter {
    name   = "tag:Name"
    values = ["1119-dev-a1-private-subnet-3-us-east-1c"]
  }
}