terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "40-CODEARTIFACT"
    }
  }
}