# EC2 Instance Child Module - Output Variables

output "public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.web.*.public_ip
}

/* use the [*] syntax to include all instances of the aws_instance.web_server 
resource */