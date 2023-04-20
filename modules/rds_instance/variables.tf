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

variable "username" {
  type        = string
  description = "The username for the RDS instance"
}

variable "password" {
  type        = string
  description = "The password for the RDS instance"
}

variable "security_group_id" {
  type        = string
  description = "The ID of the security group for the RDS instance"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}