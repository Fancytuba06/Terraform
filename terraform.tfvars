vpc_Name = "dev"                        #vpc name

pub_sub_Name = "pub-sub-s1"             #public subnet name

pri_sub_Name = "pri-sub-s2"             #private subnet name

igtw_Name = "my-igw"                    #internet gateway

rt_Name = "my-rt"                       #route table name

sg_Name = "allow_tls"                   #security group name

ec2_Name = "Bug"                        #instance name




vpc_cidr_blockr  = "10.0.0.0/16"        #vpc ip

pub_cidr_block = "10.0.1.0/24"          #public subnet ip

pri_cidr_block = "10.0.0.0/24"          #private subnet ip

rt_cidr_block = "0.0.0.0/0"             #route table ip

ingr_cidr_blocks = ["10.0.0.0/16"]      #ingress ip

engr_cidr_blocks = ["0.0.0.0/0"]        #egress ip
