terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "dev-45-MSSQL"
    }
  }
}