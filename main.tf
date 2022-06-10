resource "aws_instance" "terraformproject" {
  ami= "ami-09d56f8956ab235b3"
  instance_type= "t2.micro"
  key_name= "aws_keys"
  vpc_security_group_ids = [aws_security_group.main.id]  
  user_data = file("/terraform_project/Terraform_Project/script/jenkinsinstall.sh") 
  tags = {
     Name = "terraformproject"
     Environment = "Test"
}
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_keys"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCs7un89TTjmZoLo5wEDONOAi0v4M/h1B6aaazxU91MUsDMeWEiTXgMFLdHrhE3JlGD6XNpEY1K9jzSeu4JgPKIm9XIcyiRPVTUfMu/GhD6MTSWQrozQJfgm+bDC0txAU6fUopxptWRdT8+fjn5OqEYpnXjoN+VzfHN6/swSlXncR8Sun2RrIDL5YIbd/kGJgbhbV4JpAmTUhODzCspnbJHRV0COJLNSBseSysEIl6WiAudWGY9AQKo7E9MF0SnCSt90fRshzOR8356E3CvchVhyhcF+iYv1bkFe2IkbV/RF0oYNyHCycQC7Q6C7y1vLLZAkHEitX6pPEXlOrGuyUpJ root@ip-172-31-30-98"
}

resource "aws_s3_bucket" "may26testbucket" {
   bucket = "may26testbucket"
   
   tags = {
     Name = "may26testbucket"
     Environment = "Test"
   }
}
