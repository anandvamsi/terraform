# Map and LookUp

- Example 1

```hcl
variable "amis" {
  type = map
  default = {
    "us-east-1" = "ami-00c6177f250e07ec1"
    "us-west-2" = "ami-0f3769c8d8429942f"
  }
}

variable "region" { default = "" }

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}
```
```terraform plan -var region=us-west-2```


