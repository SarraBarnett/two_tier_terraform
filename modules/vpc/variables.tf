# VPC Child Module - Input Variables

variable "name" {
  type        = string
  description = "A name to associate with the VPC and its resources."
}

variable "region" {
  description = "The region in which to create the resources."
  type        = string
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the two public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the two private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "The availability zones in which to create the subnets."
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}