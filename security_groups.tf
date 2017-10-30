resource "aws_security_group" "docker_web_app" {
  name        = "docker_web_app"
  description = "docker host security group"
  vpc_id      = "${aws_vpc.vpc.id}"
}

resource "aws_security_group_rule" "docker_http" {
  type                  = "ingress"
  from_port             = 80
  to_port               = 80
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
  security_group_id     = "${aws_security_group.docker_web_app.id}"
}


resource "aws_security_group_rule" "docker_https" {
  type                  = "ingress"
  from_port             = 443
  to_port               = 443
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
  security_group_id     = "${aws_security_group.docker_web_app.id}"
}

resource "aws_security_group_rule" "docker_host_egress" {
  type                  = "egress"
  from_port             = 0
  to_port               = 65535
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
  security_group_id     = "${aws_security_group.docker_web_app.id}"
}
