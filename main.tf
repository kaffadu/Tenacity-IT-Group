# Tenacity IT Group VPC

resource "aws_vpc" "tenacity-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tenacity-vpc"
  }
}

# Tenacity Subnets

resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod-pub-sub1"
  }
}

resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Prod-pub-sub2"
  }
}

resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Prod-priv-sub1"
  }
}

resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Prod-priv-sub2"
  }
}

# Tenacity Route Tables & Tenacity Internet Gateway Route Association

resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.tenacity-vpc.id
  /*route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.Prod-igw.id
  }*/
  tags = {
    Name = "Prod-pub-route-table"
  }
}

resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.tenacity-vpc.id
  /*route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.Prod-Nat-gateway.id
  }*/ 
  tags = {
    Name = "Prod-priv-route-table"
  }
}

# Tenacity Subnets Associations

resource "aws_route_table_association" "pub-Sub1-Association" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

resource "aws_route_table_association" "pub-Sub2-Association" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

resource "aws_route_table_association" "priv-Sub1-Association" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

resource "aws_route_table_association" "priv-Sub2-Association" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

# Tenacity Internet Gateway

resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.tenacity-vpc.id

  tags = {
    Name = "Prod-igw"
  }
}
 
 # Associating Internet Gateway to Public Route Table

resource "aws_route" "Prod-igw-association" {
  route_table_id = aws_route_table.Prod-pub-route-table.id
  gateway_id = aws_internet_gateway.Prod-igw.id
  destination_cidr_block = "0.0.0.0/0" 
}


# Elastic ip

resource "aws_eip" "eip1" {
  vpc = true
}

# Tenacity NAT Gateway

resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.Prod-pub-sub1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}

 # Associating NAT Gateway to Private Route Table

resource "aws_route" "Prod-Nat-association" {
  route_table_id = aws_route_table.Prod-priv-route-table.id
  gateway_id = aws_nat_gateway.Prod-Nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}