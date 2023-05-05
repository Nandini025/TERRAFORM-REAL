output "id" {
  value = aws_instance.web.public_ip
}

output "ami_id" {
  value = data.aws_ami.centos.image_id
}

output "current" {
  value = data.aws_region.current.name
}

output "info" {
  value = data.aws_vpc.existing-vpc-info
}