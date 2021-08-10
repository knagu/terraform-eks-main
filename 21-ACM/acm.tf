resource "aws_acm_certificate" "cert" {
  domain_name       = "*.daxeos.io"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}