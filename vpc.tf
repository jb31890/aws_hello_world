resource "aws_vpc" "vpc" {
  cidr_block            = "${var.vpc_cidr}"

  tags {
    Name                = "${var.demo_name}"  
  }
}

resource "aws_internet_gateway" "vpc_ig" {
  vpc_id                = "${aws_vpc.vpc.id}"

  tags {
    Name                = "${var.demo_name}"
  }
}

resource "aws_subnet" "public" {
  availability_zone     = "${var.availability_zone}"
  cidr_block            = "${cidrsubnet(var.vpc_cidr, 8, 1)}"
  vpc_id                = "${aws_vpc.vpc.id}"
  
  tags {
    Name                = "${var.demo_name}"
    type                = "public"
  }
}

resource "aws_subnet" "private" {
  availability_zone     = "${var.availability_zone}"
  cidr_block            = "${cidrsubnet(var.vpc_cidr, 8, 2)}"
  vpc_id                = "${aws_vpc.vpc.id}"

  tags {
    Name                = "${var.demo_name}"
    type                = "private"
  }
}

resource "aws_eip" "nat_gw" {}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id         = "${aws_eip.nat_gw.id}"
  subnet_id             = "${aws_subnet.public.id}"

  tags {
    Name                = "${var.demo_name}"
  }

  depends_on            = ["aws_internet_gateway.vpc_ig"]
}
