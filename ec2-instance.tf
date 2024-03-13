#AWS instance ec2

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.keypair 
  vpc_security_group_ids = [
    aws_security_group.sg.id  
     
    
  ]
  subnet_id = aws_subnet.pub-sub.id

  tags = {
    Name = var.ec2_Name
  }
}

#security group 

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
