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
    s3_origin_id  = "myS3Origin"
}


#Origin access identity for CloudFront
resource "aws_cloudfront_origin_access_identity" "OAI" {
  comment = "OAI access identity for S3 buckets"
}  

#CloudFront for Test bucket
resource "aws_cloudfront_distribution" "test_distribution" {
  origin {
    domain_name = aws_s3_bucket.test.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 aliases = ["test.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
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
    acm_certificate_arn = ""
  }

}



#CloudFront for Portal bucket
resource "aws_cloudfront_distribution" "portal_distribution" {
  origin {
    domain_name = aws_s3_bucket.portal.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 aliases = ["portal.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
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
    acm_certificate_arn = ""
  }

}


#CloudFront for Header bucket
resource "aws_cloudfront_distribution" "header_distribution" {
  origin {
    domain_name = aws_s3_bucket.header.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 aliases = ["header.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
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
    acm_certificate_arn = ""
  }

}



#CloudFront for Sidebar bucket
resource "aws_cloudfront_distribution" "sidebar_distribution" {
  origin {
    domain_name = aws_s3_bucket.sidebar.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 aliases = ["sidebar.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
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
    acm_certificate_arn = ""
  }

}


#CloudFront for User bucket
resource "aws_cloudfront_distribution" "user_distribution" {
  origin {
    domain_name = aws_s3_bucket.user.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 aliases = ["user.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
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
    acm_certificate_arn = ""
  }

}



#CloudFront for styleguide bucket
resource "aws_cloudfront_distribution" "styleguide_distribution" {
  origin {
    domain_name = aws_s3_bucket.styleguide.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

 aliases = ["styleguide.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
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
    acm_certificate_arn = ""
  }

}