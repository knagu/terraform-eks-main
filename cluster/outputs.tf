
output "cluster_endpoint" {
    description = "Endpoint for EKS control plane."
    value       = data.aws_eks_cluster.cluster.endpoint
}
output "cluster_ca_certificate" {
    description = "Endpoint for EKS control plane."
    value       = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}
output "cluster_id" {
    description = "EKS cluster ID."
    value       = module.eks.cluster_id
}
output "oidc_provider_url" {
    value = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
}
output "ecr_arn" {
    value = aws_ecr_repository.ecr.arn
}
output "ecr_repository_url" {
    value = aws_ecr_repository.ecr.repository_url
}
output "ecr_registry_id" {
    value = aws_ecr_repository.ecr.registry_id
}
 