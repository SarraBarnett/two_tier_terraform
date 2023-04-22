# EC2 Instance Child Module 

resource "aws_instance" "web_server" {
  count = length(var.subnet_ids) /* creates an ec2 instance with each instance 
  assigned to a different subnet ID in the subnet_ids list */

  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  key_name      = var.key_name

  vpc_security_group_ids = [var.web_server_sg_id]
  subnet_id              = var.subnet_ids[count.index]

  user_data             = file("apache.sh")

  tags = {
    Name = "${var.name_prefix}-${count.index}"
  }
}
