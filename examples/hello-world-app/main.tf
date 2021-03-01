provider "aws" {
  region = "us-west-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

module "hello-world-app" {
  source = "../../modules/services/hello-world-app"

  environment = "module-test"
  
  db_remote_state_bucket  = "tf-states-17022020"
  db_remote_state_key     = "stage/data-stores/mysql/terraform.tfstate"

  server_port = 8080
  server_text = "Hey From Test Example!"
  
  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 1
  
  custom_tags = {
    Environment = "Test"
    DeployedBy  = "terraform"
  }

  enable_autoscaling   = false
 
}

