# Command Line Variables and Files

- Passing values

```hcl
terraform apply -var-file="variables.tfvars"
```
```hcl
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```
content of variables.tfvars
```
cloudflare_email  ="service@email.com"
cloudflare_token  ="TOKEN_STRING"
do_token          ="${DO_PAT}"
token             ="token_string"
email             ="another@email.com
```
- Passing values
```hcl
terraform apply -var "cloudflare_email=service@email.com" \
-var "cloudflare_token=TOKEN_STRING" -var "do_token=${DO_PAT}" \
-var "token=TOKEN_string -var "email=another@email.com"
```


# Variable Definition Precedence
Terraform uses the last value it finds, overriding any previous values

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

- Environment variables
- The terraform.tfvars file, if present.
- The terraform.tfvars.json file, if present.
- Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
- Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

