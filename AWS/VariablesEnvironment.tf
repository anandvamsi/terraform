export TF_VAR_username='rajesh'

provider "aws" {
  region = "us-east-1"
}
variable "username" {}


resource "aws_iam_user" "user" {
name  = var.username
tags = {
group = "admins"

}
}
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

terraform plan
terraform apply 
