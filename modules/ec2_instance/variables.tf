# EC2 Instance Child Module - Input Variables

variable "ami" {
  type        = string
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instances."
}

variable "instance_type" {
  type        = string
  description = "The type of instance to launch, such as 't2.micro'."
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for SSH access to the EC2 instances."
}

variable "web_server_sg_id" {
  type        = string
  description = "The ID of the security group to apply to the EC2 instances."
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of IDs of the subnets in which to launch the EC2 instances."
}

variable "user_data" {
  type        = string
  description = "The user data to include when launching the EC2 instances."
}

variable "name_prefix" {
  type        = string
  description = "A prefix to use for the names of the EC2 instances."
}