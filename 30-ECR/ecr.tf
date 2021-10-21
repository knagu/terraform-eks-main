data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-05-IAM"
    }
  }
}

resource "aws_ecr_repository" "ecr" {
  name                 = "${var.prefix}-${var.project}-${var.env}-ecr-uswest2-weatherapi"
  image_tag_mutability = "MUTABLE"
  tags = {
    Environment = "${var.env}"
  }
}

resource "aws_ecr_repository" "weatherapi-mfe" {
  name                 = "${var.prefix}-${var.project}-${var.env}-ecr-uswest2-weatherapi-mfe"
  image_tag_mutability = "MUTABLE"
  tags = {
    Environment = "${var.env}"
  }
}