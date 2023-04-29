resource "aws_vpc" "VPC" { # the name which we mentioned here is only understood by terraform
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Auto-VPC" # this name belongs to AWS
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.VPC.id  # it will fetch VPC ID from above code
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.VPC.id  # it will fetch VPC ID from above code
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Private-Subnet"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    Name = "Auto-IGW"
  }
}

