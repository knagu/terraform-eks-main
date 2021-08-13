
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "xyz-100-UI"
    }
  }
}