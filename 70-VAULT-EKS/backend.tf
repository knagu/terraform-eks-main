terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-70-VAULT-EKS"
    }
  }
}