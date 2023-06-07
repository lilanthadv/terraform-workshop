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

resource "aws_s3_bucket_versioning" "terraform_workshop_s3_versioning" {
  bucket = aws_s3_bucket.terraform_workshop.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "terraform-workshop-test-vpc"
    Environment = "dev"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-workshop-test-subnet-1"
    Environment = "dev"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "terraform-workshop-test-subnet-2"
    Environment = "dev"
  }
}