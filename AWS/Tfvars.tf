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

>>>
 cat values.tfvars
username = "anandvamsi"



>>Executions
terraform plan   -var-file="values.tfvars"
terraform apply  -var-file="values.tfvars"
