# queuer3000

### Setup deployment:

1. Create a unique S3 bucket in `us-east-1` aws region and provide that bucket name into `/infra/terragrunt.hcl` file
2. Create a file `.aws-credentials` in repo's root: `touch .aws-credentials`. The file is git ignored
2. Provide your AWS credentials into `.aws-credentials`
3. Generate ssh key: `ssh-keygen -f ./infra/terraform/access/ec2-key`

#### Deploy infra:

```
docker-compose run infra terragrunt apply
```

#### Destroy infra

```
docker-compose run infra terragrunt destroy
```
