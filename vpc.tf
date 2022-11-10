resource "aws_vpc" "tier-vpc" {
  cidr_block           = "11.234.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "3-tier-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tier-vpc.id

  tags = {
    Name = "3-tier-igw"
  }
}

resource "aws_subnet" "app-subnet-1" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "app-subnet-1"
  }
}

resource "aws_subnet" "app-subnet-2" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "app-subnet-2"
  }
}

resource "aws_subnet" "app-subnet-3" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "app-subnet-3"
  }
}

resource "aws_route_table" "app-rt" {
  vpc_id = aws_vpc.tier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "app rt"
  }
}

resource "aws_route_table_association" "app1" {
  subnet_id      = aws_subnet.app-subnet-1.id
  route_table_id = aws_route_table.app-rt.id
}

resource "aws_route_table_association" "app2" {
  subnet_id      = aws_subnet.app-subnet-2.id
  route_table_id = aws_route_table.app-rt.id
}

resource "aws_route_table_association" "app3" {
  subnet_id      = aws_subnet.app-subnet-3.id
  route_table_id = aws_route_table.app-rt.id
}

resource "aws_subnet" "mid-subnet-1" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.4.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "mid-subnet-1"
  }
}

resource "aws_subnet" "mid-subnet-2" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.5.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "mid-subnet-2"
  }
}

resource "aws_subnet" "mid-subnet-3" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.6.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "mid-subnet-3"
  }
}

resource "aws_subnet" "data-subnet-1" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.7.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "data-subnet-1"
  }
}

resource "aws_subnet" "data-subnet-2" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.8.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "data-subnet-2"
  }
}

resource "aws_subnet" "data-subnet-3" {
  vpc_id                  = aws_vpc.tier-vpc.id
  cidr_block              = "11.234.9.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "data-subnet-3"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.data-subnet-1.id, aws_subnet.data-subnet-2.id, aws_subnet.data-subnet-3.id]

  tags = {
    Name = "My DB subnet group"
  }
}