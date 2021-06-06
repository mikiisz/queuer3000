terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name = "ec2-key-pair"
  public_key = file("./access/ec2-key.pub")
}

data "local_file" "ec2_key" {
  filename = "${path.module}/access/ec2-key"
}

module "security_groups" {
  source = "./security"
  name = "queuer_main_sg"
  vpc_id = aws_default_vpc.default_vpc.id
  region = var.region
}

module "queuer" {
  source = "./ec2"
  ec2_security_group_id = module.security_groups.sg
  subnet_id = aws_default_subnet.default_subnet.id
  ec2_key = aws_key_pair.ec2_key_pair.key_name
  key_file = data.local_file.ec2_key.content
}

module "sqs_queue" {
  source = "./sqs"
}

module "sns_topic" {
  source = "./sns"
}