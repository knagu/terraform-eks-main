data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "10-VPC"
    }
  }
}

data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "05-IAM"
    }
  }
}

resource "aws_security_group" "worker_group" {
  name   = "worker_group_node"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sql_server" {
  name   = "sql_server_sg"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 1433
    protocol    = "tcp"
    to_port     = 1433
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "worker_security_group_id" {
  description = "Security group ids attached to the worker node."
  value       = [aws_security_group.worker_group.id]
}

output "database_security_group_id" {
  description = "Security group ids attached to the db."
  value       = [aws_security_group.sql_server.id]
}