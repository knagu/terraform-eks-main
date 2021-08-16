
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-100-UI"
    }
  }
}