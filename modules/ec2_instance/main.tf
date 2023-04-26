# EC2 Instance Child Module 

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnet_ids, count.index)

  vpc_security_group_ids = var.security_group_ids

  user_data = var.user_data

  count = var.instance_count

  tags = {
    Name = "web-server-${count.index + 1}"
  }
}