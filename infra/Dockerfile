FROM alpine/terragrunt:0.13.6

COPY ../.aws-credentials /root/.aws/credentials
COPY infra/terragrunt.hcl /apps
COPY infra/terraform /apps

WORKDIR /apps

CMD ["terragrunt", "init"]
