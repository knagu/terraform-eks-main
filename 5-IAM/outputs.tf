output "vpc_access" {
  value = aws_iam_access_key.vpc_access_key.id  
}

output "vpc_secret" {
  value     = base64encode(aws_iam_access_key.vpc_access_key.secret)
  sensitive = true
}

output "sg_access" {
  value = aws_iam_access_key.sg_access_key.id
}

output "sg_secret" {
  value     = base64encode(aws_iam_access_key.sg_access_key.secret)
  sensitive = true
}

output "ecr_access" {
  value = aws_iam_access_key.ecr_access_key.id
}

output "ecr_secret" {
  value     = base64encode(aws_iam_access_key.ecr_access_key.secret)
  sensitive = true
}

output "codeartifact_access" {
  value = aws_iam_access_key.codeartifact_access_key.id
}

output "codeartifact_secret" {
  value     = base64encode(aws_iam_access_key.codeartifact_access_key.secret)
  sensitive = true
}

output "mssql_access" {
  value = aws_iam_access_key.mssql_access_key.id
}

output "mssql_secret" {
  value     = base64encode(aws_iam_access_key.mssql_access_key.secret)
  sensitive = true
}

output "eks_access" {
  value = aws_iam_access_key.eks_access_key.id
}

output "eks_secret" {
  value     = base64encode(aws_iam_access_key.eks_access_key.secret)
  sensitive = true
}

