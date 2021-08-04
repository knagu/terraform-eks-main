terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "55-INGRESS"
    }
  }
}