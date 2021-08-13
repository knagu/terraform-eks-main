terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "xyz-05-IAM"
    }
  }
}