data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "05-IAM"
    }
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "test1.taktical.systems"
  #acl    = "authenticated-read"
  policy = file("policies/test-policy.json")

  website {
    index_document = "index.html"  
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = []    
  }
  tags = {    
    Environment = "dev"
  }
  force_destroy = true
}