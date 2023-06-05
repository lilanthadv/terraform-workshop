terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

variable "stage" {
  type        = string
  description = "The stage of the deployment (dev, stg or prod)"

  validation {
    condition     = var.stage != null
    error_message = "The stage variable must be set."
  }

  validation {
    condition     = contains(["dev", "stg","prod"], var.stage)
     error_message = "Allowed values for stage are \"dev\", \"stg\" or \"prod\"."
  }
}

variable "region" {
  type        = string
  description = "The AWS region"
  default = "ap-southeast-2"
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