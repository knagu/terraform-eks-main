terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }


    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = "> 0.12"
}

provider "aws" {
  #access_key = var.aws_access_key
  #secret_key = var.aws_secret_key
  access_key = data.terraform_remote_state.iam.outputs.mssql_access
  secret_key = base64decode(data.terraform_remote_state.iam.outputs.mssql_secret)
  region     = var.aws_region
}
