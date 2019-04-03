terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket         = "terraform-up-and-running-state-kenny"
      key            = "staging/services/web-server-cluster/terraform.tfstate"
      region         = "ca-central-1"
      encrypt        = true
      dynamodb_table = "my-cluster-lock-table"
    }
  }
}