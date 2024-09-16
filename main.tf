resource "aws_vpc" "mired" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mired-vpc"
  }
}

resource "aws_subnet" "mired" {
  vpc_id = aws_vpc.mired.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mired-subnet-1"
  }
}

resource "aws_subnet" "mired2" {
  vpc_id = aws_vpc.mired.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "mired-subnet-2"
  }
}

resource "aws_subnet" "mired3" {
  vpc_id = aws_vpc.mired.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "mired-subnet-3"
  }
}

resource "aws_internet_gateway" "mired_gtw" {
  vpc_id = aws_vpc.mired.id
  tags = {
    Name = "gateway-mired"
  }
}

resource "aws_route_table" "mired_rt" {
  vpc_id = aws_vpc.mired.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mired_gtw.id
  }
}

resource "aws_route_table_association" "mired_sub1" {
  subnet_id = aws_subnet.mired.id
  route_table_id = aws_route_table.mired_rt.id
}


resource "aws_route_table_association" "mired_sub2" {
  subnet_id = aws_subnet.mired2.id
  route_table_id = aws_route_table.mired_rt.id
}

resource "aws_route_table_association" "mired_sub3" {
  subnet_id = aws_subnet.mired3.id
  route_table_id = aws_route_table.mired_rt.id
}