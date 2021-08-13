
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "100-UI"
    }
  }
}
