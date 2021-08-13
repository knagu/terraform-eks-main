terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "05-IAM"
    }
  }
}