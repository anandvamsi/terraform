# Default Tags

AWS recommends that you define a robust and consistent tagging strategy to enable better auditing, cost, and access control for your AWS resources. The AWS Terraform provider v3.38.0+ allows you to add ```default tags to all resources that the provider creates```, 
making it easier to implement a consistent tagging strategy for all of the AWS resources you manage with Terraform.
```hcl
provider "aws" {
region = "us-west-2"
default_tags {
    tags = {
      Environment     = "Test"
      Service         = "Example"
      HashiCorp-Learn = "aws-default-tags"
    }
 }
}
```
