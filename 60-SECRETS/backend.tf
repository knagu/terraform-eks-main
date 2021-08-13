terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "SECRETS"
    }
  }
}