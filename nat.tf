resource "aws_eip" "nat-eip1" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "nat1" {
  allocation_id     = aws_eip.nat-eip1.id
  subnet_id         = aws_subnet.app-subnet-1.id
  connectivity_type = "public"

  tags = {
    Name = "gw NAT 1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat-eip2" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "nat2" {
  allocation_id     = aws_eip.nat-eip2.id
  subnet_id         = aws_subnet.app-subnet-2.id
  connectivity_type = "public"

  tags = {
    Name = "gw NAT 2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat-eip3" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "nat3" {
  allocation_id     = aws_eip.nat-eip3.id
  subnet_id         = aws_subnet.app-subnet-3.id
  connectivity_type = "public"

  tags = {
    Name = "gw NAT 3"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

