data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "05-IAM"
    }
  }
}

resource "aws_s3_bucket" "header" {
  bucket = "header.daxeos.io"
  acl    = "public-read"
  policy = file("policies/header-policy.json")

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

resource "aws_s3_bucket" "portal" {
  bucket = "portal.daxeos.io"
  acl    = "public-read"
  policy = file("policies/portal-policy.json")

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
resource "aws_s3_bucket" "sidebar" {
  bucket = "sidebar.daxeos.io"
  acl    = "public-read"
  policy = file("policies/sidebar-policy.json")

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
resource "aws_s3_bucket" "styleguide" {
  bucket = "styleguide.daxeos.io"
  acl    = "public-read"
  policy = file("policies/styleguide-policy.json")

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
resource "aws_s3_bucket" "test" {
  bucket = "test.daxeos.io"
  acl    = "public-read"
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
resource "aws_s3_bucket" "user" {
  bucket = "user.daxeos.io"
  acl    = "public-read"
  policy = file("policies/user-policy.json")

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