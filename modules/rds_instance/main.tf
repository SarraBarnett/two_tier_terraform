# RDS Instance Child Module:

resource "aws_db_instance" "rds" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]
}

/* Create an RDS db subnet group to specify the private subnets.
We will reference this in the "aws_db_instance" "rds" resource block
in the db_subnet_group_name parameter */

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}