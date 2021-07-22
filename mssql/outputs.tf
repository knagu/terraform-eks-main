output "worker_security_group_id" {
  description = "Security group ids attached to the worker node."
  value       =  data.terraform_remote_state.ecr.outputs.worker_security_group_id
}
output "vpc_id" {
  description = "VPC ID."
  value       = data.terraform_remote_state.ecr.outputs.vpc_id
}

output "private_subnets" {
  description = "VPC ID."
  value       = data.terraform_remote_state.ecr.outputs.private_subnets
}

output "cluster_name" {
  description = "cluster name"
  value       = data.terraform_remote_state.ecr.outputs.cluster_name
}

output "ecr_arn" {
    value = data.terraform_remote_state.ecr.outputs.ecr_arn
}
output "ecr_repository_url" {
    value = data.terraform_remote_state.ecr.outputs.ecr_repository_url
}
output "ecr_registry_id" {
    value = data.terraform_remote_state.ecr.outputs.ecr_registry_id
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.db_instance_endpoint
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = module.db.db_instance_id
}

output "db_instance_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db.db_instance_username
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db.db_instance_port
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = module.db.db_instance_domain
}
