data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-10-VPC"
    }
  }
}

data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-05-IAM"
    }
  }
}

resource "aws_security_group" "worker_group" {
  name   = "${var.prefix}-${var.project}-${var.env}-sg-${var.aws_region}-workergroup"
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
  name   = "${var.prefix}-${var.project}-${var.env}-sg-${var.aws_region}-sqlserver"
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

