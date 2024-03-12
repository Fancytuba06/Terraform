#AWS Route table

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = var.rt_Name
  }
}
