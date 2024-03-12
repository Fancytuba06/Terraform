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
