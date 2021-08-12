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
    test_s3_origin_id    = "testS3Origin"
    portal_s3_origin_id  = "portalS3Origin"
    styleguide_s3_origin_id  = "styleguideS3Origin"
    header_s3_origin_id  = "headerS3Origin"
    sidebar_s3_origin_id  = "sidebarS3Origin"
    user_s3_origin_id  = "userS3Origin"
}


#Origin access identity for CloudFront
resource "aws_cloudfront_origin_access_identity" "OAI" {
  comment = "OAI access identity for S3 buckets"
}  

#CloudFront for Test bucket
resource "aws_cloudfront_distribution" "test_distribution" {
  origin {
    domain_name = aws_s3_bucket.test.bucket_regional_domain_name
    origin_id   = local.test_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  comment             = "CloudFront Distribution for test.daxeos.io"

 aliases = ["test.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.test_s3_origin_id
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
    origin_request_policy_id = "CORS-S3Origin"

  }

  price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-west-2:252540742691:certificate/5ea332d3-9e4c-4a82-8149-b30cd3aaf145"
    ssl_support_method = "sni-only"
  }

}



#CloudFront for Portal bucket
resource "aws_cloudfront_distribution" "portal_distribution" {
  origin {
    domain_name = aws_s3_bucket.portal.bucket_regional_domain_name
    origin_id   = local.portal_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  comment             = "CloudFront Distribution for portal.daxeos.io"

 aliases = ["portal.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.portal_s3_origin_id
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
    origin_request_policy_id = "CORS-S3Origin"

  }

  price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-west-2:252540742691:certificate/5ea332d3-9e4c-4a82-8149-b30cd3aaf145"
    ssl_support_method = "sni-only"
  }

}


#CloudFront for Header bucket
resource "aws_cloudfront_distribution" "header_distribution" {
  origin {
    domain_name = aws_s3_bucket.header.bucket_regional_domain_name
    origin_id   = local.header_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  comment             = "CloudFront Distribution for header.daxeos.io"

 aliases = ["header.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.header_s3_origin_id
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
    origin_request_policy_id = "CORS-S3Origin"

  }

  price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-west-2:252540742691:certificate/5ea332d3-9e4c-4a82-8149-b30cd3aaf145"
    ssl_support_method = "sni-only"
  }

}



#CloudFront for Sidebar bucket
resource "aws_cloudfront_distribution" "sidebar_distribution" {
  origin {
    domain_name = aws_s3_bucket.sidebar.bucket_regional_domain_name
    origin_id   = local.sidebar_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  comment             = "CloudFront Distribution for sidebar.daxeos.io"

 aliases = ["sidebar.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.sidebar_s3_origin_id
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
    origin_request_policy_id = "CORS-S3Origin"

  }

  price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-west-2:252540742691:certificate/5ea332d3-9e4c-4a82-8149-b30cd3aaf145"
    ssl_support_method = "sni-only"
  }

}

#CloudFront for User bucket
resource "aws_cloudfront_distribution" "user_distribution" {
  origin {
    domain_name = aws_s3_bucket.user.bucket_regional_domain_name
    origin_id   = local.user_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  comment             = "CloudFront Distribution for user.daxeos.io"

 aliases = ["user.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.user_s3_origin_id
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
    origin_request_policy_id = "CORS-S3Origin"

  }

  price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-west-2:252540742691:certificate/5ea332d3-9e4c-4a82-8149-b30cd3aaf145"
    ssl_support_method = "sni-only"
  }

}



#CloudFront for styleguide bucket
resource "aws_cloudfront_distribution" "styleguide_distribution" {
  origin {
    domain_name = aws_s3_bucket.styleguide.bucket_regional_domain_name
    origin_id   = local.styleguide_s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }
  enabled             = true
  comment             = "CloudFront Distribution for styleguide.daxeos.io"

 aliases = ["styleguide.daxeos.io"]

 default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.styleguide_s3_origin_id
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
    origin_request_policy_id = "CORS-S3Origin"

  }

  price_class = "PriceClass_All"
   restrictions {
      geo_restriction {
        restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-west-2:252540742691:certificate/5ea332d3-9e4c-4a82-8149-b30cd3aaf145"
    ssl_support_method = "sni-only"
  }

}