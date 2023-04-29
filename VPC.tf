resource "aws_vpc" "VPC" { # the name which we mentioned here is only understood by terraform
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Auto-VPC" # this name belongs to AWS
  }
}