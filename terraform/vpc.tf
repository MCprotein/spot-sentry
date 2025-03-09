resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "aws_vpc_main"
  }
}

resource "aws_subnet" "first_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
    Name = "aws_subnet_first"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "aws_igw_main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "aws_rt_main"
  }
}

resource "aws_route_table_association" "first" {
  subnet_id      = aws_subnet.first_subnet.id
  route_table_id = aws_route_table.main.id
}
