# VPC Child Module 


resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.name
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }
  tags = {
    Name = "${var.name}-public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-private-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-internet-gateway"
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_1.id
  depends_on    = [aws_internet_gateway.my_internet_gateway]
}