resource "aws_instance" "terraformproject" {
  ami= "ami-0f095f89ae15be883"
  instance_type= "t2.micro"
  key_name= "aws_keys"
  vpc_security_group_ids = [aws_security_group.main.id]  
  tags = {
     Name = "terraformproject"
     Environment = "Test"
   }

 provisioner "remote-exec"  {
    inline  = [
      "sudo yum install -y jenkins java-11-openjdk-devel",
      "sudo yum -y install wget",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install jenkins -y",
      "sudo systemctl start jenkins",
	  "sudo yum install -y python",	  
      ]
   }
 connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = file("/home/byogi/terraform-project/devopsproject/keys/aws_keys")
      timeout     = "10m"
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG13HVlqDaPpRkfFekbvpLYkjahE8gw3SgMgHBf2YfQsssR7ws+7nQWrvZP8QVMCgsPmuOkVF4feeeR6zWWm6z1+Sy2x6W6CcFp/s9fEBakOMEb1sbUOKVq4ikGRQQPfZxy1cjGpxzM8fexMfVcBzFpNfmeNq5owl77+Yx61S3HAM9CIeC7uLt+ZiNw1nqlSrhQ2nfnux3HNxM7rSgOdJNWJ3xrwlZ7mlXRutvQiqJFNMkV+v4HHBVD2FIA9NR5LCsKNyfW9wlXXNZZgZyO2sAHerr5W8DhwJlRFGNqT1HWlKA0lJ572FPq0e2Mmv2xijYWMykK9BaOJsRWY9iXfyp byogi@localhost.localdomain"
}

resource "aws_s3_bucket" "may26testbucket" {
   bucket = "may26testbucket"
   
   tags = {
     Name = "may26testbucket"
     Environment = "Test"
   }
}
