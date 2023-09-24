# Why Do We Need a Remote Backend?

When working with Terraform locally, the state files are ```created in the project’s root directory```. This is known as the local backend and is the default. 
These files cannot be a part of the Git repository as every member may execute their version of Terraform config and end up modifying the state files. 
Thus there is a high chance of corrupting the state file, or at least inconsistency in the state files. which is equally dangerous. Managing the state files in a
remote Git repository is also discouraged as the state files may contain ```sensitive information like credentials, etc```.

# Core Features of any Backend
- Secure Storage
- Locking

## Secure Storage

State files need to be stored in a secured and remote location. Remote, so that multiple developers working on the same set of Terraform configuration files can have validation access in their workflow.
This avoids having to maintain multiple copies of state files at the same time handling them manually.

File storage solutions like AWS S3 offer a secure and reliable way to store and access files within and outside
of the internal network

## Locking
Continuing with the integrity aspect, when multiple developers access the same state file multiple times
to validate their changes to Terraform config, the race condition may cause the file to be corrupted. Thus, ```there is a need for a locking mechanism.```

When Terraform operations are performed (plan, apply, destroy), the state files are locked for the duration of the operation. If another developer tries to execute their operations during this time, the request is queued. 
The operation resumes when the current operation is completed, and the lock over the state file is released

```
When using AWS S3 buckets as a remote state backend, DynamoDB is used to support thislocking mechanism.
It holds a single boolean attribute named “LockID” that indicates whether the operation on the state file can be performed or not
```

Terraform S3 Backend Implementation
- Create a s3 bucket with versioning and encryption enabled
- Create a dynamodb table "mycomponents_tf_lockid" with partition key "LockID"

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "mycomponents-tfstate"
    key              	   = "state/terraform.tfstate"
    region         	   = "eu-central-1"
    encrypt        	   = true
    dynamodb_table = "mycomponents_tf_lockid"
  }
}
```



