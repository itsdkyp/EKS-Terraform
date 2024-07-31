resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${local.env}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_vpc.main.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "${local.env}-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
