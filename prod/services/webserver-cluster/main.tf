terraform {
  backend "s3" {}
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size = 2
  max_size = 10
  desired_capacity = 10
  recurrence = "0 9 * * *"

  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size = 2
  max_size = 10
  desired_capacity = 2
  recurrence = "0 17 * * *"

  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "terraform-up-and-running-state-kenny"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
  healthy_threshold = 2
  unhealthy_threshold = 2
  auto_scaling_min_size = 5
  auto_scaling_max_size = 10
}