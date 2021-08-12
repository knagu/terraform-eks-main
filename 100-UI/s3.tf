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
  acl    = "private"
  policy = file("policies/header-policy.json")

  website {
    index_document = "daxeos-header.js"  
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

resource "aws_s3_bucket_public_access_block" "header" {
  bucket = aws_s3_bucket.header.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "portal" {
  bucket = "portal.daxeos.io"
  acl    = "private"
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

resource "aws_s3_bucket_public_access_block" "portal" {
  bucket = aws_s3_bucket.portal.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "sidebar" {
  bucket = "sidebar.daxeos.io"
  acl    = "private"
  policy = file("policies/sidebar-policy.json")

  website {
    index_document = "daxeos-sidebar.js"  
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

resource "aws_s3_bucket_public_access_block" "sidebar" {
  bucket = aws_s3_bucket.sidebar.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "styleguide" {
  bucket = "styleguide.daxeos.io"
  acl    = "private"
  policy = file("policies/styleguide-policy.json")

  website {
    index_document = "daxeos-styleguide.js"  
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

resource "aws_s3_bucket_public_access_block" "styleguide" {
  bucket = aws_s3_bucket.styleguide.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "test" {
  bucket = "test.daxeos.io"
  acl    = "private"
  policy = file("policies/test-policy.json")

  website {
    index_document = "daxeos-test-mfe.js"  
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

resource "aws_s3_bucket_public_access_block" "test" {
  bucket = aws_s3_bucket.test.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "user" {
  bucket = "user.daxeos.io"
  acl    = "private"
  policy = file("policies/user-policy.json")

  website {
    index_document = "daxeos-user-mfe.js"  
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

resource "aws_s3_bucket_public_access_block" "user" {
  bucket = aws_s3_bucket.user.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

