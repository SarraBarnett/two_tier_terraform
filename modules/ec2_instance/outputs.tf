# EC2 Instance Child Module - Output Variables

output "instance_id" {
  value = aws_instance.web_server[*].id
}

output "public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.web_server[*].public_ip
}

output "private_ip" {
  value = aws_instance.web_server[*].private_ip
}

/* use the [*] syntax to include all instances of the aws_instance.web_server 
resource */