terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "10-VPC"
    }
  }
}
