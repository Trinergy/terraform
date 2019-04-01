terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-kenny"
    key = "global/s3/terraform.tfstate"
    region = "ca-central-1"
    encrypt = true
  }
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

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}