splat expression allows us to get a list of all the attributes.

resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
}

output "arns" {
    value = aws_iam_user.lb[*].arn
}


##Terraform apply 
Outputs:

arns = [
  "arn:aws:iam::192085538099:user/iamuser.0",
  "arn:aws:iam::192085538099:user/iamuser.1",
  "arn:aws:iam::192085538099:user/iamuser.2",
]



Notes >>
we can manually specify 0,1,2 instead of *
value = aws_iam_user.lb[0].name

name,arn ..etc are easily available terraform documentation
