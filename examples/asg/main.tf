provider "aws" {
  region = "us-west-1"
}

module "asg" {
  source = "../../modules/cluster/asg-rolling-deploy"

  cluster_name  = "module-asg-test"
  ami           = "ami-0bbea0b44d7c17bfa"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello Test" > index.html
              nohup python3 -m http.server 8080 --bind 0.0.0.0 &
              EOF

  min_size            = 1
  max_size            = 1
  enable_autoscaling  = false

  subnet_ids = data.aws_subnet_ids.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

