terraform {
  backend "s3" {
    bucket = "terraform-workshop-prod-remote-state-s3"
    key = "terraform.tfstate"
    region = "ap-southeast-2"
    dynamodb_table = "terraform-workshop-prod-remote-state-s3"
  }
}