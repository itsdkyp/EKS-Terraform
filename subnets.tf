resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/18"
  availability_zone = local.zone1

  tags = {
    "Name" = "${local.env}-private-${local.zone1}"
    "kubernetes.io/role/internal-elb" = "1"
     "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.64.0/18"
  availability_zone = local.zone2

  tags = {
    "Name" = "${local.env}-private-${local.zone2}"
    "kubernetes.io/role/internal-elb" = "1"
     "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.128.0/18"
  availability_zone = local.zone1
  map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "${local.env}-public-${local.zone1}"
    "kubernetes.io/role/elb" = "1"
     "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.192.0/18"
  availability_zone = local.zone2
  map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "${local.env}-public-${local.zone2}"
    "kubernetes.io/role/elb" = "1"
     "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}