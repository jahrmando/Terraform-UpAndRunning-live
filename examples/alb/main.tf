provider "aws" {
  region = "us-west-1"
}

module "alb" {
  source = "../../modules/networking/alb"

  alb_name    = "module-test-alb"
  subnet_ids  = data.aws_subnet_ids.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

