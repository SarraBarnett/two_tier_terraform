# RDS Instance Child Module - Input Variables

variable "engine" {
  description = "The name of the database engine to use"
  type        = string
}
variable "engine_version" {
  description = "The version of the database engine to use for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  type        = number
  description = "The amount of storage to allocate for the RDS instance"
}

variable "instance_class" {
  type        = string
  description = "The instance class for the RDS instance"
  default     = "db.t2.micro"
}

variable "db_name" {
  type        = string
  description = "The name of the RDS instance"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "rds_username" {
  description = "The username for the RDS instance"
}

variable "rds_password" {
  description = "The password for the RDS instance"
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the RDS instance"
  type        = list(string)
}