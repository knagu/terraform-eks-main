
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "30-ECR"
    }
  }
}
