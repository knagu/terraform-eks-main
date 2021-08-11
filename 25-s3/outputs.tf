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

output "test_website_endpoint" {
  value = aws_s3_bucket.test.website_endpoint
}

output "user_website_endpoint" {
  value = aws_s3_bucket.user.website_endpoint
}

