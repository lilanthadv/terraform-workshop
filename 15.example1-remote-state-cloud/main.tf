terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ideabits-terraform-workshop"

    workspaces {
      name = "terraform-workshop-dev-test"
    }
  }
}

locals {
  service = "terraform-workshop-${var.stage}-test"
}

provider "aws" {
  region = var.region
}

module "s3" {
  source      = "./modules/s3"
  service     = local.service
  stage       = var.stage
}

module "vpc" {
  source      = "./modules/vpc"
  service     = local.service
  stage       = var.stage
}

module "subnet" {
  source      = "./modules/subnet"
  service     = local.service
  stage       = var.stage
  vpc_id      = module.vpc.vpc_id
}