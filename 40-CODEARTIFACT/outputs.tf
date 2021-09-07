output "nuget_repository_endpoint" {
  value = data.aws_codeartifact_repository_endpoint.codeartifact_nuget_endpoint.repository_endpoint
}

output "npm_repository_endpoint" {
  value = data.aws_codeartifact_repository_endpoint.codeartifact_npm_endpoint.repository_endpoint
}