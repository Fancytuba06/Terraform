#vpc name

variable "vpc_Name" {
   type = string
   description = "vpc name"
}

#vpc cidr block

variable "vpc_cidr_blockr" {
   type = string
   description = "vpc ip address"
}


#pub subnet name

variable "pub_sub_Name" {
   type = string
   description = "public subnet"
} 

#pub subnet cidr block

variable "pub_cidr_block" {
   type = string
   description = "public subnet ip"
} 

#pri subnet name

variable "pri_sub_Name" {
   type = string
   description = "private subnet"
} 

#private subnet ip

variable "pri_cidr_block" {
   type = string
   description = "public subnet ip"
} 

#internet gateway name

variable "igtw_Name" {
   type = string
   description = "internetgateway"
}

#route table name

variable "rt_Name" {
   type = string
   description = "route table"
} 

#route table ip

variable "rt_cidr_block" {
   type = string
   description = "route table ip"
} 

#security group name

variable "sg_Name" {
   type = string
   description = "security group"
} 

#ingress ip

variable "ingr_cidr_blocks" {
   type = list(string)
   description = "ingress security group"
}

#engress ip

variable "engr_cidr_blocks" {
   type = list(string)
   description = "engress security group"
}

#ec2-instance name

variable "ec2_Name" {
   type = string
   description = "AWS instance ec2"
} 

# instance type

variable "instance_type" {
   type = string
   description = "AWS instance type"
} 

variable "ami" {
   type = string
   description = "ami type"
} 


variable "keypair" {
   type = string
   description = "key pair"
}
