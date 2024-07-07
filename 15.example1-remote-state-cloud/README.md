# Terraform Workshop

## 15.example1-remote-state-cloud

`terraform init`\
`terraform validate`\
`terraform plan`\
`terraform apply`\
`terraform destroy`

## create new s3 bucket and dynamodb_table

## replace below values in main.tf file

`backend "remote" {`\
`hostname = ""`\
`organization = ""`\
    workspaces {
      name = ""
    }
`}`\
