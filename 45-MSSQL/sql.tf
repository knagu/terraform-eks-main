data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "10-VPC"
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

data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "05-IAM"
    }
  }
}

locals {
  tags = {
    Environment = "learning"
  }
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = "learning-db-mssql"


  engine               = "sqlserver-ex" # SQL server edition (express, standard, web, enterprise)
  engine_version       = "15.00.4073.23.v1"
  family               = "sqlserver-ex-15.0" # DB parameter group based on engine
  major_engine_version = "15.00"             # DB option group
  instance_class       = "db.t3.small"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = false

  name     = null
  username = "mssql_user"
  password = var.sql_password
  port     = 1433


  multi_az               = false
  subnet_ids             = data.terraform_remote_state.vpc.outputs.database_subnets
  vpc_security_group_ids = data.terraform_remote_state.sg.outputs.database_security_group_id
  publicly_accessible    = true


  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60

  options                   = []
  create_db_parameter_group = false
  license_model             = "license-included"
  timezone                  = "GMT Standard Time"
  character_set_name        = "Latin1_General_CI_AS"

  tags = local.tags
}