# RDS Instance Child Module - Output Variables

output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}

output "rds_port" {
  value = aws_db_instance.rds.port
}

output "rds_username" {
  value = aws_db_instance.rds.db_username
}

output "rds_password" {
  value = aws_db_instance.rds.db_password
}

/* an output variable called db_instance that will be referenced by
the aws_db_instance resource in the child module. */