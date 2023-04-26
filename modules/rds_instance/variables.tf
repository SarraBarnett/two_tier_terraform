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
  description = "The amount of storage to allocate for the RDS instance"
  type        = number
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the database to create on the RDS instance"
  type        = string
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets to launch the RDS instance in"
  type        = list(string)
}

variable "rds_username" {
  description = "The username for the RDS instance"
}

variable "rds_password" {
  description = "The password for the RDS instance"
}

variable "security_group_ids" {
  description = "The IDs of the security groups to associate with the RDS instance"
  type        = list(string)
}

variable "skip_final_snapshot" {
  description = <<DESC
    If set to true, the RDS instance will be deleted without taking a final snapshot. 
    If set to false, this value is required to prevent the RDS instance from being deleted without taking a final snapshot.
  DESC
  type        = bool
  default     = true
}