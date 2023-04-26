# Root Directory - Output Variables

output "web_server_public_ips" {
  description = "Public IP addresses of the web server instances"
  value       = module.web_server.public_ip
}

output "rds_endpoint" {
  description = "The endpoint for the RDS MySQL instance"
  value       = module.mysql_db.rds_endpoint
}
