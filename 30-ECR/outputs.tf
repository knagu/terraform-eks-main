output "ecr_arn" {
  value = aws_ecr_repository.ecr.arn
}
output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}
output "ecr_registry_id" {
  value = aws_ecr_repository.ecr.registry_id
}
output "weatherapi-mfe_ecr_arn" {
  value = aws_ecr_repository.weatherapi-mfe.arn
}
output "weatherapi-mfe_ecr_repository_url" {
  value = aws_ecr_repository.weatherapi-mfe.repository_url
}
