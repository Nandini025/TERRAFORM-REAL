resource "aws_vpc" "main" { # the name which we mentioned here is only understood by terraform
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Auto-VPC" # this name belongs to AWS
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id  # it will fetch VPC ID from above code
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id  # it will fetch VPC ID from above code

  tags = {
    Name = "Private-Subnet"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id #IGW depends on VPC

  tags = {
    Name = "Auto-IGW"
  }
}

resource "aws_route_table" "Public-Route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Public-Route"
  }
}

resource "aws_route_table" "Private-Route" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Private-Route"
  }
}
resource "aws_eip" "elastic-ip" {

}
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.IGW]
}

