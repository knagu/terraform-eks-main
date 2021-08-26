terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-65-HCP"
    }
  }
}