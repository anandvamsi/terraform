provider "aws" {
        region = "us-west-2"
        shared_credentials_file = "~/.aws/credentials"
        profile = "default"
}

data "aws_ami" "app_ami" {
        most_recent = true
        owners = ["amazon"]

        filter {
                name = "name"
                values = ["amzn2-ami-hvm*"]
        }

}

resource "aws_instance" "myami" {
        ami = data.aws_ami.app_ami.id
        instance_type = "t2.micro"


}
----------------------------------------------------
Notes
Keep a note of AMI ID for each execution  while changing the regions 
ie change the region and check the AMI id 
 us-west-2
 us-east-1
  
 we dont have have to hardcode the AMI each time.
