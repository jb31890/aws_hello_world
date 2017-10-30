provider "aws" {
  region                    = "${var.aws_region}"
  shared_credentials_file   = "${var.aws_credentials_file}"
}

resource "aws_key_pair" "demo_key" {
  key_name      = "${var.demo_key}"
  public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr6BtWmMQuP9Qc9lRpzgbY/grUIgQpMAHnnInXuI+34WQzu7XIacP1DM1QOt6v9IVQVVj1k5pnu0i2fb41IkNZko3mGqhYWkjo6qTx/ldjnNZemVc7XlA01g8yp9gclnMo2/cy1iMU9c59yHGgvwhDQFZbsF0Zh8aqLGNs48PgOoPzXVmucQKVi6HthdPXLRezh6goLfPQpYFgpkUuJ2/sIA2PL3DQJ+yP2tsdCo1K9Xy9P3TTb51KGQj0cUMA1TJcqqQcRh+x5oaDlguT55CufYkF4TuChSxSmnD9UZsO86GrIVB3UM0j2r6uYHlJVWnKAkroPxiF/kUmlwbinwmN"
} 

data "aws_ami" "ec2_linux" {
  most_recent   = true
  filter {
    name        = "name"
    values      = ["amzn-ami-*-x86_64-gp2"]
  }
  filter {
    name        = "virtualization-type"
    values      = ["hvm"]
  }
  filter {
    name        = "owner-alias"
    values      = ["amazon"]
  }
}
