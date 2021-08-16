
terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-30-ECR"
    }
  }
}
