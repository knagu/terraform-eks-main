terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-50-EKS"
    }
  }
}