
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-20-SG"
    }
  }
}
