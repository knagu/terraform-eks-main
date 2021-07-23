resource "aws_ecr_repository" "ecr" {
  name                 = "weatherapi"
  image_tag_mutability = "MUTABLE"
  tags = {
    Environment = "dev"
  }
}