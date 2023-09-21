# Command Line Variables and Files

- Passing values

```hcl
terraform apply -var-file="variables.tfvars"
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
