# Fiap Burger Gateway Terraform

```bash
# import environment variables (from .env)
export $(grep -v '^#' .env | xargs)

# validate
terraform fmt --check
terraform validate

# plan
terraform plan

# apply
terraform apply --auto-approve
```
