terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket         = "terraform-up-and-running-state-kenny"
      key            = "prod/data-stores/mysql/terraform.tfstate"
      region         = "ca-central-1"
      encrypt        = true
      dynamodb_table = "my-prod-db-lock-table"
    }
  }
}