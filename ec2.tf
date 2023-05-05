resource "aws_instance" "web" {
  ami           = data.aws_ami.centos.id
  instance_type = "t3.micro"

  tags = {
    Name = "WEB"
  }
}
data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"

}