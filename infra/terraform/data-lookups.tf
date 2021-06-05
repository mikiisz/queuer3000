resource "aws_default_vpc" "default_vpc" {}

resource "aws_default_subnet" "default_subnet" {
  availability_zone = format("%s%s", var.region, "a")
}