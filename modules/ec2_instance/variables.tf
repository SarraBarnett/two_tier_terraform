# EC2 Instance Child Module - Input Variables

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c94855ba95c71c99"
}

variable "key_name" {
  description = "Name of key pair to use for EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for EC2 instance"
  type        = list(string)
}


variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for EC2 instance"
  type        = list(string)
}

variable "user_data" {
  type    = string
  default = null
}