## Terraform environtment
Before init terraform, create a s3 bucket and update terraform backend in main.tf
This app runs using AWS Fargate and have a ALB in front of service.

### Deploy terraform environment
```
cd terraform
terraform init
terraform apply
```

### Destroy terraform environment
```
terraform init
terraform destroy
```