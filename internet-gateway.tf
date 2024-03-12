#AWS internet gateway

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = var.igtw_Name
  }
}
