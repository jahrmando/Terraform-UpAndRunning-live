terraform {
  backend "s3" {
    bucket          = "tf-states-17022020"
    key             = "prod/services/webserver-cluster/terraform.tfstate"
    region          = "us-west-1"

    dynamodb_table  = "terraform-up-and-running-locks"
    encrypt         = true
  }
}

