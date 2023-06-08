locals {
  service = var.service
  stage = var.stage
  vpc_id = var.vpc_id
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = local.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${local.service}-subnet-1"
    Environment = local.stage
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = local.vpc_id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${local.service}-subnet-2"
    Environment = local.stage
  }
}