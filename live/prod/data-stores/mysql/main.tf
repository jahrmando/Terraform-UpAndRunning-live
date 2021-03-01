provider "aws" {
  region = "us-west-1"
}

module "data_store_mysql" {
  source = "github.com/jahrmando/Terraform-UpAndRunning-modules//data-stores/mysql?ref=v0.0.2"
  cluster_name  = "mysql-prod"
  db_password   = var.db_password
}

