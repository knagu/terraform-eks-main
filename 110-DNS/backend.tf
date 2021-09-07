terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-110-DNS"
    }
  }
}