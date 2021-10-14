provider "aws" {
region = "us-east-1"
}

resource "aws_iam_user" "admins" {
name = "admins.${count.index}"
count = 3
}

## This will create user admin0..admin1
