# VPC Child Module - Output Variables

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  value = aws_route_table.private_route_table.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.my_internet_gateway.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}


/* The output blocks allow us to export the IDs of the created 
vpc and subnets, which we can then reference in the root module */