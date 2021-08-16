terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-10-VPC"
    }
  }
}
