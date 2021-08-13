terraform {
  backend "remote" {
    organization = "Harika"

    workspaces {
      name = "45-MSSQL"
    }
  }
}