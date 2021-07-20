output "worker_security_group_id" {
  description = "Security group ids attached to the worker node."
  value       =  data.terraform_remote_state.sg.outputs.worker_security_group_id
}
output "vpc_id" {
  description = "VPC ID."
  value       = data.terraform_remote_state.sg.outputs.vpc_id
}

output "private_subnets" {
  description = "VPC ID."
  value       = data.terraform_remote_state.sg.outputs.private_subnets
}

output "cluster_name" {
  description = "cluster name"
  value       = data.terraform_remote_state.sg.outputs.cluster_name
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