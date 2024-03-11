terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#AWS Provider

provider "aws" {
  region = "us-east-1"
}

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

resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.dev.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingr_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.engr_cidr_blocks
  }

  tags = {
    Name = var.sg_Name
  }
}

#AWS instance ec2

resource "aws_instance" "web" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name      = "demo" 
  vpc_security_group_ids = [
    aws_security_group.sg.id,  
     
    
  ]
  subnet_id = aws_subnet.pub-sub.id

  tags = {
    Name = var.ec2_Name
  }
}


