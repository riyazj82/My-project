terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "photoviewer-bucket"
  acl    = "public-read-write"
 tags = {
    Name        = "photoviewer-bucket"
    
  }
}