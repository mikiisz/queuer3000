resource "aws_iam_role" "ec2_role" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.ec2_role.id
  policy = data.aws_iam_policy_document.ec2_policy.json
}

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    actions = [
      "sqs:*",
      "sns:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"

  subnet_id = var.subnet_id
  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  key_name = var.ec2_key

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  provisioner "remote-exec" {
    inline = [
      "export AWS_DEFAULT_REGION=${var.region}",
      "sudo pip3 install boto3"
    ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_dns
    private_key = var.key_file
  }
}

