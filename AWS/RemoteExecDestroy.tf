provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  ami               = "ami-0c2b8ca1dad447f8a"
  key_name          = "generic"

  provisioner "remote-exec" {

    inline = [
      "sudo  amazon-linux-extras install nginx1.12 -y",
      "sudo systemctl start nginx"

    ]

  }

  provisioner "remote-exec" {
    when = destroy
    inline = [

      "sudo yum remove nginx -y "
    ]
  }



  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./generic.pem")
   host        = self.public_ip

  }


  provisioner "local-exec" {
    command = "echo ${aws_instance.app.private_ip} >> data"
  }

}

>>>>>>>>>>>>>>>>
  Use this when you want to destory the server 
  - remove Agents
  - unsubscribe from the services.
