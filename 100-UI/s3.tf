data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "xyz-05-IAM"
    }
  }
}


resource "aws_s3_bucket" "header" {
  bucket = "${var.env}-header.daxeos.io"
  acl    = "private"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1548223592786",
    "Statement": [
        {
            "Sid": "Stmt1548223591553",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.OAI.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.env}-header.daxeos.io/*"                
            ]
        }
    ]
}
EOF

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
    Environment = "${var.env}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "header" {
  bucket                  = aws_s3_bucket.header.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "portal" {
  bucket = "${var.env}-portal.daxeos.io"
  acl    = "private"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1548223592786",
    "Statement": [
        {
            "Sid": "Stmt1548223591553",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.OAI.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.env}-portal.daxeos.io/*"
            ]
        }
    ]
}
EOF

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
    Environment = "${var.env}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "portal" {
  bucket                  = aws_s3_bucket.portal.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#################################################################################


resource "aws_s3_bucket" "sidebar" {
  bucket = "sidebar.daxeos.io"
  acl    = "private"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1548223592786",
    "Statement": [
        {
            "Sid": "Stmt1548223591553",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.OAI.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.env}-sidebar.daxeos.io/*"
            ]
        }
    ]
}
EOF

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
    Environment = "${var.env}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "sidebar" {
  bucket                  = aws_s3_bucket.sidebar.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "styleguide" {
  bucket = "${var.env}-styleguide.daxeos.io"
  acl    = "private"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1548223592786",
    "Statement": [
        {
            "Sid": "Stmt1548223591553",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.OAI.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.env}-styleguide.daxeos.io/*"
            ]
        }
    ]
}
EOF

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
    Environment = "${var.env}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "styleguide" {
  bucket                  = aws_s3_bucket.styleguide.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "test" {
  bucket = "${var.env}-test.daxeos.io"
  acl    = "private"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1548223592786",
    "Statement": [
        {
            "Sid": "Stmt1548223591553",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.OAI.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.env}-test.daxeos.io/*"
            ]
        }
    ]
}
EOF

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
    Environment = "${var.env}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "test" {
  bucket                  = aws_s3_bucket.test.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#################################################################################

resource "aws_s3_bucket" "user" {
  bucket = "${var.env}-user.daxeos.io"
  acl    = "private"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1548223592786",
    "Statement": [
        {
            "Sid": "Stmt1548223591553",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.OAI.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.env}-user.daxeos.io/*"
            ]
        }
    ]
}
EOF
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
    Environment = "${var.env}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "user" {
  bucket                  = aws_s3_bucket.user.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}