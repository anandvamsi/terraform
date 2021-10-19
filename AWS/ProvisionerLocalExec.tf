Terraform has capability to turn provisioner  both at the time of resouce creation as well as destruction 
- Two types of provisioners 

1.local-exec 
2.remote-exec

local-exec 
Local exec provisioner allow ws to invoke local executables after resource is created 
- Usecases
where you want execute Ansible script after creation of the resource 



provider "aws" {
region = "us-east-1"
}


resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  ami               = "ami-0c2b8ca1dad447f8a"
  key_name          = "myec2"

provisioner "local-exec" {

command = "echo ${aws_instance.app.private_ip} >> data"

}

}
---------------------
  
cat data
172.31.18.235
