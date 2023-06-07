locals {
    service = var.service
    stage = var.stage
}

resource "aws_s3_bucket" "terraform_workshop" {
  bucket = "${local.service}-bucket"

  tags = {
    Name        = "${local.service}-bucket"
    Environment = local.stage
  }
}

resource "aws_s3_bucket_versioning" "terraform_workshop_s3_versioning" {
  bucket = aws_s3_bucket.terraform_workshop.id
  versioning_configuration {
    status = "Enabled"
  }
}