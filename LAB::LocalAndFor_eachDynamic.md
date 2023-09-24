# Lab demostrate local and for_each
The for_each argument will iterate over a data structure to configure resources or modules with each item in turn.
It works best when the duplicate resources need to be configured differently but share the same lifecycle.


- Legacy code
```hcl
resource "aws_security_group" "foreachusecase" {
  name        = "demo_for_foreach_usecase"
  description = "demo_for_foreach_usecase"
  vpc_id = "vpc-095fXXXXXX"
  ingress {
    description = "rule for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
  ingress {
    description = "rule for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
}
```

- Using for_each
  
```hcl
  
  locals {
  ports = [80, 22]
}
resource "aws_security_group" "foreachusecase" {
  name        = "demo_for_foreach_usecase"
  description = "demo_for_foreach_usecase"
  dynamic "ingress" {
    for_each = local.ports
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8"]
    }
  }
}
```

