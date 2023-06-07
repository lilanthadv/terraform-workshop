locals {
  service = "terraform-workshop-${var.stage}-test"
}

module "s3" {
  source      = "../../modules/s3"
  service     = local.service
  stage       = var.stage
}

module "vpc" {
  source      = "../../modules/vpc"
  service     = local.service
  stage       = var.stage
}

module "subnet" {
  source      = "../../modules/subnet"
  service     = local.service
  stage       = var.stage
  vpc_id      = module.vpc.vpc_id
}