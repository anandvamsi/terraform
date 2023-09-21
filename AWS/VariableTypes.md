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
