data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-05-IAM"
    }
  }
}

data "terraform_remote_state" "cluster" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-50-EKS"
    }
  }
}

data "terraform_remote_state" "hcp" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-35-HCP"
    }
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.cluster.outputs.cluster_id
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.cluster.outputs.cluster_id
}

resource "helm_release" "vault_agent" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.10.0"

  values = [
    "${file("values.yaml")}"
  ]

  set {
    name  = "injector.externalVaultAddr"
    value = data.terraform_remote_state.hcp.outputs.vault_public_endpoint_url
  }
}