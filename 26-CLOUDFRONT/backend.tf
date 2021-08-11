
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "26-CLOUDFRONT"
    }
  }
}
