# VPC Child Module - Input Variables

variable "name" {
  type        = string
  description = "The name of the VPC"
}

variable "region" {
  description = "The region in which to create the resources."
  type        = string
}


variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "The availability zones to use for subnets"
}


variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}