output "worker_security_group_id" {
  description = "Security group ids attached to the worker node."
  value       = [aws_security_group.worker_group.id]
}

output "database_security_group_id" {
  description = "Security group ids attached to the db."
  value       = [aws_security_group.sql_server.id]
}