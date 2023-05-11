output "vpc_id" {
    value = aws_vpc.tenacity-vpc.id
}

output "vpc_cidr_block" {
    value = aws_vpc.tenacity-vpc.cidr_block
}

output "aws_Prod-pub-sub1_cidr" {
    value = aws_subnet.Prod-pub-sub1.cidr_block
}

output "aws_Prod-pub-sub1_subnet_id" {
    value = aws_subnet.Prod-pub-sub1.id
  
}

output "aws_Prod-pub-sub2_cidr" {
    value = aws_subnet.Prod-pub-sub2.cidr_block
}

output "aws_Prod-pub-sub2_subnet_id" {
    value = aws_subnet.Prod-pub-sub2.id
}

output "aws_Prod-priv-sub1_cidr" {
    value = aws_subnet.Prod-priv-sub1.cidr_block
}

output "aws_Prod-priv-sub1_subnet_id" {
    value = aws_subnet.Prod-priv-sub1.id
}

output "aws_Prod-priv-sub2_cidr" {
    value = aws_subnet.Prod-priv-sub2.cidr_block
}

output "aws_Prod-priv-sub2_subnet_id" {
    value = aws_subnet.Prod-priv-sub2.id
}

output "aws_Prod-pub_route_table" {
    value = aws_route_table.Prod-pub-route-table.id
}

output "aws_Prod-priv_route_table" {
    value = aws_route_table.Prod-priv-route-table.id
}

output "aws_internet_gateway" {
    value = aws_internet_gateway.Prod-igw.id
}

output "aws_eip" {
    value = aws_eip.eip1.id
}

output "aws_Nat_gateway" {
    value = aws_nat_gateway.Prod-Nat-gateway.id
}