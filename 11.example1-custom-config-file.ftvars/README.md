# Terraform Workshop

## 11.example1-custom-config-file.ftvars

`terraform init`\
`terraform validate`\
`terraform plan`\
`terraform apply`\
`terraform destroy`

## pass custom .ftvars file

### dev

`terraform plan -var-file="./env/dev.tfvars"`\
`terraform apply -var-file="./env/dev.tfvars"`

### stg

`terraform plan -var-file="./env/stg.tfvars"`\
`terraform apply -var-file="./env/stg.tfvars"`

### prod

`terraform plan -var-file="./env/prod.tfvars"`\
`terraform apply -var-file="./env/prod.tfvars"`

## override .tfvars varibles using command-line flags

`terraform plan -var="stage=stg"`\
`terraform apply -var="stage=stg"`
