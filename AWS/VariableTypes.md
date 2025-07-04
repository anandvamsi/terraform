# Variables types
- String

```hcl
variable "private_key_path" {
  type = string
  description = "Need of this variable"
  default = "/home/user/.ssh/terraform_rsa"
}

variable "public_key" {
  type = string
  default = "ssh-rsa terraform_public_key"
}
```
In this example:

- `variable` is used to declare an input variable named `example_var`.
- `description` provides a human-readable description of the variable.
- `type` specifies the data type of the variable (e.g., `string`, `number`, `list`, `map`, etc.).
- `default` provides a default value for the variable, which is optional



- Boolean
```hcl
variable "set_password" {
  type = bool
  default = false
}
```


- Map and Lookup
  
```hcl
variable "zones" {
  type = map
  default = {
    "amsterdam" = "nl-ams1"
    "london"    = "uk-lon1"
    "frankfurt" = "de-fra1"
    "helsinki1" = "fi-hel1"
    "helsinki2" = "fi-hel2"
    "chicago"   = "us-chi1"
    "sanjose"   = "us-sjo1"
    "singapore" = "sg-sin1"
  }
```
- Setting up the environment variables
```hcl
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
```

- Locals
Local values can be helpful to avoid repeating the same values or expression multiple times in a configrations.
Locals are (in my opinion) variables but when you don't need to change the variable (local) VALUE
Resources Tags is an good use case.

```hcl
  locals {
common_tags = {
        Owners = "Devops team"
        service = "backend"
        }
}
```

- Output variables
Output variables allow you to expose values from your module or configuration, making them available for use in other parts of your Terraform setup. Here's how you define an output variable:
```hcl
output "example_output" {
  description = "An example output variable"
  value       = resource.example_resource.example.id
}
```


- validation
```hcl
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
```
In the above Example checks whether the AMI ID has the correct syntax.
Note: This feature was introduced in Terraform CLI v0.13.0.

- Data sources
Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.
Use of data sources allows a Terraform configuration to make use of information defined outside of Terraform, or defined by another separate Terraform configuration


```hcl
data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^myami-\\d{3}"
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["myami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
```

Example::- Data source

```hcl
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
```
