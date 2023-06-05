terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "terraform_workshop" {
  bucket = "terraform-workshop-test-bucket"

  tags = {
    Name        = "terraform-workshop-test-bucket"
    Environment = "dev"
  }
}