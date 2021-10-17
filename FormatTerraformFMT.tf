Terraform FMT will change the format from irregular alingment to regular alingment 



>>Before formatting

cat ec2-instance_dataSource.tf

provider "aws" {
          region                  = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}



data "aws_ami" "app_ami" {
  most_recent = true
          owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "myami" {
  ami           = data.aws_ami.app_ami.id
          instance_type = "t2.micro"
}
(base) root@ubuntu-master:~/T-recipes/datasource#
(base) root@ubuntu-master:~/T-recipes/datasource# terraform fmt
ec2-instance_dataSource.tf

>> After formatting 
(base) root@ubuntu-master:~/T-recipes/datasource# cat ec2-instance_dataSource.tf

provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}



data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "myami" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}
