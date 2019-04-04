provider "aws" {
  region = "ca-central-1"
}

terraform {
  backend "s3" {}
}

module "db_instance" {
  source = "../../../modules/data-stores/mysql"

  allocated_storage = 10
  name = "example_database"
  username = "admin"
  password = "${var.db_password}"
}