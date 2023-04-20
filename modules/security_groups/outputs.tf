# Security Groups Child Module - Output Variables

output "web_server_sg_id" {
  value = aws_security_group.web_server_sg.id
}

output "rds_sg_id" {
  description = "The ID of the security group for the RDS instance"
  value       = aws_security_group.rds_sg.id
}

/* The output blocks allow us to export the IDs of the created 
security groups, which we can then reference in the root module */