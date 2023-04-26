# EC2 Instance Child Module - Output Variables

output "public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.web.*.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance(s)"
  value       = aws_instance.web.*.private_ip
}

output "instance_ids" {
  description = "The ID(s) of the EC2 instance(s)"
  value       = aws_instance.web.*.id
}

#  use the * (wildcard) to reference all of the public and 
#  private IP addresses, and all IDs of the EC2 Instances. 