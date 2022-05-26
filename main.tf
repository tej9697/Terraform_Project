resource "aws_instance" "terraformproject" {
  ami= "ami-0f095f89ae15be883"
  instance_type= "t2.micro"
  key_name= "testputty"  
    tags = {
    Name = "This server is created as a project work"
}

}

resource "aws_s3_bucket" "may26testbucket" {
   bucket = "may26testbucket"
   
   tags = {
     Name = "may26testbucket"
     Environment = "Test"
   }
}
