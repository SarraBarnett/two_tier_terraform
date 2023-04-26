# EC2 Instance Child Module - Input Variables

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-03c7d01cf4dedc891"
}

variable "key_name" {
  description = "Name of key pair to use for EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to attach to the EC2 instance"
  type        = list(string)
}


variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}

variable "public_subnet_ids" {
  description = "A list of public subnet IDs where the EC2 instance should be launched"
  type        = list(string)
}

variable "user_data" {
  type    = string
  default = null
}