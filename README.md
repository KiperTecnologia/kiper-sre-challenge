# The Test

You must fork this repository and using your skills and knowledge, you must modify the application according to the requirements below:

- The application must run via docker.
- The PORT on which the application runs should be easily configurable and not hardcoded.
- The external url should be easily configurable and without being hardcoded.

In addition we want you to create and describe in the a pull request, how would you. replicate this app until production, including:

- Automation of steps until there.
- Monitoring.
- Continuous Integration.
- Continuous Delivery.

## Indispensable requirements

- README with explanation of what you planned.
- Your infraestructure must be able to be reproduced locally.

## Desirable Requirements

You can use the tools you want, delivering and explaining why each step is what counts, however the items below are a plus.
- Jenkins
- Bitbucket
- AWS

## What will be evaluated

- Flexibility
- Performance
- Way you are delivering this test
- Infra as code
- Complexity

## Running
```
docker-compose up -d
```

## Using
http://localhost or http://graphql.binganetworks.com.br
You can change application URL changing nginx/default.conf

## Testing
Use this query in playground
## Write your query or mutation here
query {
  allBrands {
    name
  }
}

## Production build
This project use Jenkinsfile for deploy.

## Terraform environtment
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

# TODO NEXT...
- Jenkinsfile deploy AWS FARGATE
- Documentations
- Bitbucket-ci as alternative CI
