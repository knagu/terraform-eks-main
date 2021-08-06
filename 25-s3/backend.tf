
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "25-S3"
    }
  }
}
