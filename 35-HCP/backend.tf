terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-35-HCP"
    }
  }
}