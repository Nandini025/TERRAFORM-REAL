resource "aws_vpc" "main" { # the name which we mentioned here is only understood by terraform
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = merge(var.tags,{Name="VPC"}) # VPC Name in AWS
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id  # it will fetch VPC ID from above code
  cidr_block = "var.public-cidr"

  tags = merge(var.tags,{Name="public-subnet"})
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id  # it will fetch VPC ID from above code
  cidr_block = "var.private-cidr"
  tags = merge(var.tags,{Name="private-subnet"})
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id #IGW depends on VPC

  tags = merge(var.tags,{Name="IGW"})
}

resource "aws_route_table" "Public-Route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public-route-IGW
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = merge(var.tags,{Name="public-route"})
}

resource "aws_route_table" "Private-Route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.public-route-IGW
    gateway_id = aws_nat_gateway.NAT.id
  }
  tags = merge(var.tags,{Name="private-route"})
}
resource "aws_eip" "elastic-ip" {

}
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public.id

  tags = merge(var.tags,{Name="NAT"})

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.IGW]
}

resource "aws_route_table_association" "Public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.Public-Route.id
}
resource "aws_route_table_association" "Private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.Private-Route.id
}























