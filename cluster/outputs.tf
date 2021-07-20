
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

output "ecr_arn" {
    value = data.terraform_remote_state.cluster.outputs.ecr_arn
}
output "ecr_repository_url" {
    value = data.terraform_remote_state.cluster.outputs.ecr_repository_url
}
output "ecr_registry_id" {
    value = data.terraform_remote_state.cluster.outputs.ecr_registry_id
}