resource "aws_instance" "web" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "WEB"
  }
}
data "aws_ami" "centos" {
  owners      = [var.aws-accounts[data.aws_region.current.name]]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"

}

data "aws_region" "current" {}

data "aws_vpc" "existing-vpc-info" {
  id = "VPC-07204ah520q" # give vpc id which is existed one
}
