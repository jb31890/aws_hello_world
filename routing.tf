resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  
  route {
    cidr_block = "0/0"
    gateway_id = "${aws_internet_gateway.vpc_ig.id}"
  }

  tags {
    Name = "${var.demo_name}_public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags {
    Name = "${var.demo_name}_private"
  }
}
