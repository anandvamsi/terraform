Terraform taint
------------------
The terraform taint command informs Terraform that a particular object has become degraded or damaged. 
Terraform represents this by marking the object as "tainted" in the Terraform state,
in which case Terraform will propose to replace it in the next plan you create.
    
  
 THis command will not modify infrastrucute,but does modify the state file in order to mark a resource as tainted.
 Once a resource is marked a tained the next paln will show the at resource will be destroyed  and recreated 
  
  
  
#terraform taint aws_security_group.allow_tls
Resource instance aws_security_group.allow_tls has been marked as tainted.
    
 Double check the tfstate file ,look for the status you will be be show the status "tainted"
   
>>>>>>Now do Terraform apply; resource will be created
   
   terraform apply
aws_security_group.allow_tls: Refreshing state... [id=sg-0a70cb878ac54b62d]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_security_group.allow_tls is tainted, so must be replaced
-/+ resource "aws_security_group" "allow_tls" {
      ~ arn                    = "arn:aws:ec2:us-west-2:192085538099:security-group/sg-0a70cb878ac54b62d" -> (known after apply)
      ~ egress                 = [] -> (known after apply)
      ~ id                     = "sg-0a70cb878ac54b62d" -> (known after apply)
        name                   = "allow_tls"
      + name_prefix            = (known after apply)
      ~ owner_id               = "192085538099" -> (known after apply)
      - tags                   = {} -> null
      ~ tags_all               = {} -> (known after apply)
      ~ vpc_id                 = "vpc-0736337f" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.
        
    
  ##Terraform taint with Modules
    Taint the resource "aws_instance" "baz" resource that lives in module bar which lives in module foo. :- terraform taint module.foo.module.bar.aws_instance
