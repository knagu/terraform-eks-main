data "terraform_remote_state" "mssql" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "45-MSSQL"
    }
  }
}
data "terraform_remote_state" "ecr" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "30-ECR"
    }
  }
}
data "terraform_remote_state" "sg" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "20-SG"
    }
  }
}
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "10-VPC"
    }
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = data.terraform_remote_state.vpc.outputs.cluster_name
  cluster_version = "1.20"
  subnets         = data.terraform_remote_state.vpc.outputs.private_subnets

  tags = {
    Environment = "learning"
  }

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  workers_group_defaults = {
    root_volume_type = "gp2"
    root_volume_size = 8
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.medium"
      asg_desired_capacity          = 1
      additional_security_group_ids = data.terraform_remote_state.sg.outputs.worker_security_group_id
    },
  ]
}
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_ami" "eks_worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-1.18-v*"]
  }

  most_recent = true

  owners = ["amazon"]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
