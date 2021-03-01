provider "aws" {
  region = "us-west-1"
}

module "mysql" {
  source = "../../modules/data-stores/mysql"
  
  cluster_name  = "module-test-mysql"
  db_password   = "an15tR0ngPP4s5vv0rd"
}
