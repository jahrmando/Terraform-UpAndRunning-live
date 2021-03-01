# PRODUCTION
provider "aws" {
  region = "us-west-1"
}

module "webserver_cluster" {
  source = "github.com/jahrmando/Terraform-UpAndRunning-modules//services/webserver-cluster?ref=v0.0.2"

  # Variables
  cluster_name = "webservers-stage"
  db_remote_state_bucket  = "tf-states-17022020"
  db_remote_state_key     = "prod/data-stores/mysql/terraform.tfstate"
  
  instance_type = "t3.micro"
  min_size      = 3
  max_size      = 10
}

enable_autoscaling = true
# resource "aws_autoscaling_schedule" "scale_out" {
  # scheduled_action_name = "scale-out-during-bussines-hours"
  # min_size             = 2
  # max_size             = 10
  # desired_capacity     = 8
  # recurrence           = "0 9 * * *"
#
  # autoscaling_group_name = module.webserver_cluster.asg_name
# }
#
# resource "aws_autoscaling_schedule" "scale_in" {
  # scheduled_action_name = "scale-in-at-night"
  # min_size             = 2
  # max_size             = 10
  # desired_capacity     = 2
  # recurrence           = "0 17 * * *"
#
  # autoscaling_group_name = module.webserver_cluster.asg_name
# }

