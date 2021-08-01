terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "50-EKS"
    }
  }
}