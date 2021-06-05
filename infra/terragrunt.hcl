remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "queuer3000"
    key = "terraform.state"
    region = "us-east-1"
  }
}

terraform {
  source = ".//terraform"
}

inputs = {
  region = "us-east-1"
}
