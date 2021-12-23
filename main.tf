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
resource "aws_iam_role" "unauthenticated" {
  name = "cognito_unauthenticated"

  assume_role_policy = <<EOF
  {
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "s3:ListBucket"
         ],
         "Resource": [
            "arn:aws:s3:::photoviewer-bucket"
         ]
      }
   ]
}
EOF
}