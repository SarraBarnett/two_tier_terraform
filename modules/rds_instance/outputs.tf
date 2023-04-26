# RDS Instance Child Module - Output Variables

output "rds_endpoint" {
  description = "The endpoint URL of the RDS instance"
  value       = aws_db_instance.rds.endpoint
}

output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.rds.id
}

output "rds_instance_security_groups" {
  description = "The IDs of the security groups associated with the RDS instance"
  value       = aws_db_instance.rds.vpc_security_group_ids
}