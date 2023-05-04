cidr = "10.0.0.0/16"
public-cidr = "10.0.1.0/24"
private-cidr = "10.0.2.0/24"
public-route-IGW = "0.0.0.0/0"
ALB = true
Load-type = "application"
Subnet-List = ["provide subnet id list here"]
security-group = ["provide security groups here"]
tags = {
Name = "Project"
Environment = "DEV"
terraform = "true"
}
