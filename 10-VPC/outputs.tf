output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "VPC ID."
  value       = module.vpc.private_subnets
}

output "cluster_name" {
  description = "cluster name"
  value       = local.cluster_name
}

output "database_subnets" {
  description = "database subnets"
  value       = module.vpc.database_subnets
}