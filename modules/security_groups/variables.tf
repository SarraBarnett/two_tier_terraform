# Security Groups Child Module - Input Variables

variable "name" {
  description = "Name of the security group"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
}

variable "web_server_ingress_ports" {
  description = "List of ports to allow ingress traffic to web servers"
  default     = [80, 443]
  type        = list(number)
}

variable "rds_ingress_ports" {
  description = "List of ports to allow ingress traffic to RDS"
  default     = [3306]
  type        = list(number)
}

variable "web_sg_ids" {
  type = list(string)
}

variable "rds_sg_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(any)
}