

provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
}

output "names" {
    value = aws_iam_user.lb[*].name
}

output "arn" {
    value = aws_iam_user.lb[*].arn
}

>>>>>
ways to get output  using terraform output 
1.using the output in the terraform configration files
2. using terraform output command

terraform output arn
[
  "arn:aws:iam::192085538099:user/iamuser.0",
  "arn:aws:iam::192085538099:user/iamuser.1",
  "arn:aws:iam::192085538099:user/iamuser.2",
]
(base) root@ubuntu-master:~/T-recipes/dynamicBlocks# terraform output names
[
  "iamuser.0",
  "iamuser.1",
  "iamuser.2",
]

3.From the terraform state file.
