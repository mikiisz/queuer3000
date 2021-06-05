# queuer3000

### Setup deployment:

1. [Create a unique S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-overview.html) in `us-east-1` aws region
2. Provide created bucket's name as value for `bucket=` key inside `infra/terragrunt.hcl` file
3. Create a file `.aws-credentials` in repo's root: `touch .aws-credentials`. The file is git ignored
4. Provide your AWS credentials into `.aws-credentials`
5. Generate ssh key: `ssh-keygen -f ./infra/terraform/access/ec2-key`

#### Deploy infra:

```
docker-compose run infra terragrunt apply
```

#### Destroy infra

```
docker-compose run infra terragrunt destroy
```
