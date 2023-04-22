# Root Directory - Output Variables

output "web_server_public_ips" {
  description = "Public IP addresses of the web server instances"
  value       = module.web_server.public_ips
}

output "rds_endpoint" {
  description = "The endpoint for the RDS MySQL instance"
  value       = module.rds_instance.rds_endpoint
}

output "security_group_id" {
  description = "The ID of the security group for the RDS instance"
  value       = module.security_groups.rds_sg_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}
