variable "cidr" {
  type = string
 # default = "10.0.0.0/16" # if you don't define terraform will ask us at run time. or we can define at terraform.tfvars
}
variable "public-cidr" {
  type= string
}

variable "private-cidr" {
  type= string
}
variable "tags" {
  type = map(list(string))

}

variable "public-route-IGW" {
  type= string
}

variable "ALB" {
  type = bool
}
variable "Load-type" {
  type = string
}
variable "Subnet-List" {
  type = list(string)
}

variable "security-group" {
  type= list(string)
}