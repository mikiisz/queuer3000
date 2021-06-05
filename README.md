# queuer3000

### Setup deployment:

1. Create S3 bucket with a name `queuer3000` in `us-east-1` region
2. Provide your AWS credentials into .aws-credentials file

```
docker-compose up --build
```

### Deploy infra:

```
docker-compose run infra terragrunt apply
```

### Destroy infra

```
docker-compose run infra terragrunt destroy
```