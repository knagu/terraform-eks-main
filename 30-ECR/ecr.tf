data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "05-IAM"
    }
  }
}

resource "aws_ecr_repository" "ecr" {
  name                 = "weatherapi"
  image_tag_mutability = "MUTABLE"
  tags = {
    Environment = "dev"
  }
}

resource "aws_ecr_repository" "user" {
  name                 = "user"
  image_tag_mutability = "MUTABLE"
  tags = {
    Environment = "dev"
  }
}