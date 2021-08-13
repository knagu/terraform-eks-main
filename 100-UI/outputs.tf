output "header_website_endpoint" {
  value = aws_s3_bucket.header.website_endpoint
}

output "portal_website_endpoint" {
  value = aws_s3_bucket.portal.website_endpoint
}

output "sidebar_website_endpoint" {
  value = aws_s3_bucket.sidebar.website_endpoint
}

output "styleguide_website_endpoint" {
  value = aws_s3_bucket.styleguide.website_endpoint
}

output "user_website_endpoint" {
  value = aws_s3_bucket.user.website_endpoint
}

output "test_website_endpoint" {
  value = aws_s3_bucket.test.website_endpoint
}

output "test_cdn_domain_name" {
  value = aws_cloudfront_distribution.test_distribution.domain_name
}

output "portal_cdn_domain_name" {
  value = aws_cloudfront_distribution.portal_distribution.domain_name
}
output "header_cdn_domain_name" {
  value = aws_cloudfront_distribution.header_distribution.domain_name
}

output "sidebar_cdn_domain_name" {
  value = aws_cloudfront_distribution.sidebar_distribution.domain_name
}
output "styleguide_cdn_domain_name" {
  value = aws_cloudfront_distribution.styleguide_distribution.domain_name
}
output "user_cdn_domain_name" {
  value = aws_cloudfront_distribution.user_distribution.domain_name
}
