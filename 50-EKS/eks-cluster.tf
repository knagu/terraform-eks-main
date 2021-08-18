data "terraform_remote_state" "sg" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-20-SG"
    }
  }
}
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

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = data.terraform_remote_state.vpc.outputs.cluster_name
  cluster_version = "1.20"
  subnets         = data.terraform_remote_state.vpc.outputs.private_subnets

  tags = {
    Environment = "${var.env}"
  }

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  workers_group_defaults = {
    root_volume_type = "gp2"
    root_volume_size = 8    
    capacity_rebalance = true    
  }

  worker_groups = [
    {
      name                          = "wgnode"
      instance_type                 = "t2.medium"      
      asg_min_size                  = 1
      asg_max_size                  = 1
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
