terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

locals {
  service = "terraform-workshop-${var.stage}-test"
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_workshop" {
  bucket = "${local.service}-bucket"

  tags = {
    Name        = "${local.service}-bucket"
    Environment = var.stage
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
    Name = "${local.service}-vpc"
    Environment = var.stage
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${local.service}-subnet-1"
    Environment = var.stage
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${local.service}-subnet-2"
    Environment = var.stage
  }
}