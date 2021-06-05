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

module "security_groups" {
  source = "./security"
  name = "queuer_main_sg"
  vpc_id = aws_default_vpc.default_vpc.id
}

module "consumer" {
  source = "./ec2"
  ec2_security_group_id = module.security_groups.sg
  subnet_id = aws_default_subnet.default_subnet.id
  ec2_key = aws_key_pair.ec2_key_pair.key_name
}

module "producer" {
  source = "./ec2"
  ec2_security_group_id = module.security_groups.sg
  subnet_id = aws_default_subnet.default_subnet.id
  ec2_key = aws_key_pair.ec2_key_pair.key_name
}
