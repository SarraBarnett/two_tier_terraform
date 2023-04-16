resource "aws_vpc" "project_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "project_vpc"
  }
}

variable "cidr_block" {}