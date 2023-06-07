# Terraform Workshop

## 15.example1-multiple-env

`terraform init`
`terraform validate`
`terraform plan`
`terraform apply`
`terraform destroy`

## create new s3 bucket and dynamodb_table

## replace below values in main.tf file

bucket = ""
key = ""
region = ""
dynamodb_table = ""

##

`terraform workspace list` - showing workspace list
`terraform workspace show` - showing current workspace name

## dev

`terraform workspace new dev`
`terraform workspace select dev`
`terraform plan -var-file="dev.tfvars"`
`terraform apply -var-file="dev.tfvars"`
`terraform destroy -var-file="dev.tfvars"`

## stg

`terraform workspace new stg`
`terraform workspace select stg`
`terraform plan -var-file="stg.tfvars"`
`terraform apply -var-file="stg.tfvars"`
`terraform destroy -var-file="stg.tfvars"`

## prod

`terraform workspace new prod`
`terraform workspace select prod`
`terraform plan -var-file="prod.tfvars"`
`terraform apply -var-file="prod.tfvars"`
`terraform destroy -var-file="prod.tfvars"`
