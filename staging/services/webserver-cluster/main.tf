terraform {
  backend "s3" {}
}

provider "aws" {
  region = "ca-central-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-staging"
  db_remote_state_bucket = "terraform-up-and-running-state-kenny"
  db_remote_state_key = "staging/data-stores/mysql/terraform.tfstate"
  healthy_threshold = 2
  unhealthy_threshold = 2
  auto_scaling_min_size = 2
  auto_scaling_max_size = 10
}