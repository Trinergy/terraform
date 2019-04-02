terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket         = "terraform-up-and-running-state-kenny"
      key            = "global/s3/terraform.tfstate"
      region         = "ca-central-1"
      encrypt        = true
      dynamodb_table = "my-lock-table"
    }
  }
}