
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "20-SG"
    }
  }
}
