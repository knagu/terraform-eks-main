data "aws_availability_zones" "available" {}

data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-05-IAM"
    }
  }
}

locals {
  cluster_name = "${var.prefix}-${var.project}-${var.env}-eks-${var.aws_region}"
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
  source  = ".\\Modules\\vpc"
  //version = "2.66.0"

  name                           = "${var.prefix}-${var.project}-${var.env}-vpc-${var.aws_region}"
  cidr                           = "10.0.0.0/16"
  azs                            = data.aws_availability_zones.available.names
  private_subnets                = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets                 = ["10.0.3.0/24", "10.0.4.0/24"] 
  database_subnets               = ["10.0.5.0/24", "10.0.6.0/24"]    
  #database_inbound_acl_rules     = local.network_acls["database_inbound"]
  #database_outbound_acl_rules    = local.network_acls["database_outbound"]
  create_database_subnet_group   = true
  #database_dedicated_network_acl = true 

  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  default_security_group_name = "${var.prefix}-${var.project}-${var.env}-sg-${var.aws_region}-default"
  default_network_acl_name = "${var.prefix}-${var.project}-${var.env}-nacl-${var.aws_region}-default" 
  prefix = "${var.prefix}" 
  project = "${var.project}"
  env = "${var.env}"

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
    Environment = "dev"
  }
}