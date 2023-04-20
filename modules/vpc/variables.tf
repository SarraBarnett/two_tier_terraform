# VPC Child Module - Input Variables

variable "name" {
  type        = string
  description = "The name of the VPC"
}

variable "region" {
  description = "The region in which to create the resources."
  type        = string
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "The CIDR block for the public subnets"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "The CIDR block for the private subnets"
}