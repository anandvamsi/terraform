RemoteExec
---------------
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

Notes:-
Before executing the code enable the security group with 22 allowed to IP address.

Logs which says the IP is connected
-----------------
aws_instance.app: Creating...
aws_instance.app: Still creating... [10s elapsed]
aws_instance.app: Still creating... [20s elapsed]
aws_instance.app: Still creating... [30s elapsed]
aws_instance.app: Still creating... [40s elapsed]
aws_instance.app: Provisioning with 'remote-exec'...
aws_instance.app (remote-exec): Connecting to remote host via SSH...
aws_instance.app (remote-exec):   Host: 34.204.42.251
aws_instance.app (remote-exec):   User: ec2-user
aws_instance.app (remote-exec):   Password: false
aws_instance.app (remote-exec):   Private key: true
aws_instance.app (remote-exec):   Certificate: false
aws_instance.app (remote-exec):   SSH Agent: false
aws_instance.app (remote-exec):   Checking Host Key: false
aws_instance.app: Still creating... [50s elapsed]
aws_instance.app (remote-exec): Connected!



