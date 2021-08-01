output "vpc_access" {
  value = aws_iam_access_key.vpc_access_key.id
}

output "vpc_secret" {
  value     = aws_iam_access_key.vpc_access_key.secret
  sensitive = true
}