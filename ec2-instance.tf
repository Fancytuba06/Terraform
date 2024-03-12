#AWS instance ec2

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.keypair 
  vpc_security_group_ids = [
    aws_security_group.sg.id,  
     
    
  ]
  subnet_id = aws_subnet.pub-sub.id

  tags = {
    Name = var.ec2_Name
  }
}
