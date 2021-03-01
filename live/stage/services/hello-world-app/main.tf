provider "aws" {
  region = "us-west-1"

  # Allow any 2.x version of the AWS provider
  # version = "~> 2.0"
}

module "hello_world_app" {
  source = "git@github.com:jahrmando/Terraform-UpAndRunning-modules.git//services/hello-world-app?ref=v0.0.6"

  environment = "stage"
  
  db_remote_state_bucket  = "tf-states-17022020"
  db_remote_state_key     = "stage/data-stores/mysql/terraform.tfstate"

  server_port = 8080
  server_text = "New server text for staging"
  
  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
  
  enable_autoscaling   = false
  
  custom_tags = {
    Environment = "staging"
    DeployedBy  = "terraform"
  }
}
