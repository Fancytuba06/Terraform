#AWS vpc

resource "aws_vpc" "dev" {
  cidr_block  = var.vpc_cidr_blockr
                                                                      
  tags = {
    Name = var.vpc_Name
  }
}
