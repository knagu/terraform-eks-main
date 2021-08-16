terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-05-IAM"
    }
  }
}