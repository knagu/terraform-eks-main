terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-55-INGRESS"
    }
  }
}