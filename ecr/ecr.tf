data "terraform_remote_state" "sg" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "my-SG"
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