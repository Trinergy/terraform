terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket         = "terraform-up-and-running-state-kenny"
      key            = "global/s3/system/terraform.tfstate"
      region         = "ca-central-1"
      encrypt        = true
      dynamodb_table = "my-system-lock-table"
    }
  }
}