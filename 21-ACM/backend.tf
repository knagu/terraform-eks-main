
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "21-ACM"
    }
  }
}
