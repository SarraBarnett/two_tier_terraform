# Security Groups Child Module 

# Define security group for the web server:

resource "aws_security_group" "web_server_sg" {
  name_prefix = "${var.name}-web-server-sg"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-web-sg"
  }
}

# Create inbound rule for web server security group
resource "aws_security_group_rule" "web_server_ingress" {
  type              = "ingress"
  from_port         = var.web_server_ingress_ports[0]
  to_port           = var.web_server_ingress_ports[1]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_server_sg.id
}

# Create outbound rule for web server security group to allow traffic to RDS security group
resource "aws_security_group_rule" "web_server_egress" {
  type                     = "egress"
  from_port                = var.rds_ingress_ports[0]
  to_port                  = var.rds_ingress_ports[0]
  protocol                 = "tcp"
  security_group_id        = aws_security_group.web_server_sg.id
  source_security_group_id = aws_security_group.rds_sg.id
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_server_sg.id
}

# Define security group for RDS database:

resource "aws_security_group" "rds_sg" {
  name_prefix = "${var.name}-rds-sg"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-rds-sg"
  }
}

# Create inbound rule for RDS security group
resource "aws_security_group_rule" "rds_ingress" {
  type                     = "ingress"
  from_port                = var.rds_ingress_ports[0]
  to_port                  = var.rds_ingress_ports[0]
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_sg.id
  source_security_group_id = aws_security_group.web_server_sg.id
}