#AWS vpc

resource "aws_vpc" "dev" {
  cidr_block  = var.vpc_cidr_blockr
                                                                      
  tags = {
    Name = var.vpc_Name
  }
}

#AWS pub subnet

resource "aws_subnet" "pub-sub" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.pub_cidr_block
                                                                    
  tags = {
    Name = var.pub_sub_Name
  }
}

#AWS pri subnet

resource "aws_subnet" "pri-sub-s2" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.pri_cidr_block

  tags = {
    Name = var.pri_sub_Name
  }
}

#AWS internet gateway

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = var.igtw_Name
  }
}

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

#AWS route table associates

resource "aws_route_table_association" "my-rt-ass" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.my-rt.id
}
