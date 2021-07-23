data "aws_availability_zones" "available" {}

locals {
  cluster_name = "learning-eks-${random_string.suffix.result}"
  network_acls = {    
    database_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "10.0.0.0/16"
      },
    ]
    database_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "10.0.0.0/16"
      },
    ]
  }

}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

  name                           = "learning-vpc"
  cidr                           = "10.0.0.0/16"
  azs                            = data.aws_availability_zones.available.names
  private_subnets                = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets                 = ["10.0.3.0/24", "10.0.4.0/24"]
  database_subnets               = ["10.0.5.0/24", "10.0.6.0/24"]    
  database_inbound_acl_rules     = local.network_acls["database_inbound"]
  database_outbound_acl_rules    = local.network_acls["database_outbound"]
  create_database_subnet_group   = true
  database_dedicated_network_acl = true 

  #create_database_subnet_route_table     = true
  #create_database_internet_gateway_route = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
  database_subnet_tags = {
    Owner       = "user"
    Environment = "learning"
  }
}


output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "VPC ID."
  value       = module.vpc.private_subnets
}

output "cluster_name" {
  description = "cluster name"
  value       = local.cluster_name
}

output "database_subnets" {
  description = "database subnets"
  value       = module.vpc.database_subnets
}