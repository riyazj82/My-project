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
resource "aws_cognito_identity_pool" "main" {
  identity_pool_name               = "photoviewer"
  allow_unauthenticated_identities = true
}