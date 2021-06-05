resource "aws_instance" "ec2" {
  ami = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"

  subnet_id = var.subnet_id
  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  key_name = var.ec2_key
}

