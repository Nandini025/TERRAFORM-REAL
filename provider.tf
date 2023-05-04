terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
    backend "s3" {
      bucket = "my bucket" # give our created bucket name
      key    = "path/to/my/key" #give any name
      region = "us-east-1" # created bucket region
      dynamodb_table = "name" # give the created name
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # change the region based on your selected region
}