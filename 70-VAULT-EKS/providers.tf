terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
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

    vault = {
      source = "hashicorp/vault"
      version = "2.23.0"
    }
  }

  required_version = "> 0.12"
}

provider "aws" {  
  access_key = data.terraform_remote_state.iam.outputs.eks_access
  secret_key = base64decode(data.terraform_remote_state.iam.outputs.eks_secret)
  region     = var.aws_region
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.cluster.outputs.cluster_endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
  }
  
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.cluster.outputs.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
}

provider "vault" {
 address = data.terraform_remote_state.hcp.outputs.vault_public_endpoint_url
 token =  base64decode(data.terraform_remote_state.hcp.outputs.vault_token)
}