terraform {
  backend "s3" {}
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-kenny"

  versioning {
    enabled = true
  }
  
  lifecycle {
    prevent_destroy = true
  }
}