data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "05-IAM"
    }
  }
}

locals {
    s3_origin_id_test9440  = " "
}

resource "aws_s3_bucket" "test9440" {
    bucket = "test9440.taktical.systems"
    acl = "private"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_cloudfront_origin_access_identity.origin_access_identity_test9440.iam_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::test9440.taktical.systems/*"
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
    Environment = "dev"
  }
  force_destroy = true
}
resource "aws_s3_bucket_public_access_block" "s3bucket_test9440" {
  bucket = aws_s3_bucket.test9440.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}


#Origin access identity for CloudFront
resource "aws_cloudfront_origin_access_identity" "origin_access_identity_test9440" {
  comment = "OAI access identity for test9440"
}  
#CloudFront for private s3 bucket
resource "aws_cloudfront_distribution" "s3_distribution_test9440" {
  origin {
    domain_name = aws_s3_bucket.test9440.bucket_regional_domain_name
    origin_id   = local.s3_origin_id_test9440
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity_test9440.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id_test9440
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
  }

    price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }

}