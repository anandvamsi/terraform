provider "aws" {
region = "us-east-1"
}


module "ec2" {
        source = "./modules/ec2"
}


(base) root@ubuntu-master:~/T-recipes/module2# cat modules/ec2/main.tf
resource "aws_instance" "first_instance" {
        ami = "ami-0c2b8ca1dad447f8a"
        instance_type = var.instance_type

}


(base) root@ubuntu-master:~/T-recipes/module2# cat modules/ec2/variables.tf
variable "instance_type" {
default = "t2.small"


>>>
    Add a variable in outer main.tf for the values instance_type which will override the value inner instance_type
