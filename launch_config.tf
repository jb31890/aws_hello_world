data "template_file" "userdata" {
  template                      = "${file("userdata.tpl")}"
}

resource "aws_launch_configuration" "docker_lc" {
  name_prefix                   = "${var.demo_name}"
  key_name                      = "${var.demo_key}"
  image_id                      = "${data.aws_ami.ec2_linux.id}"
  instance_type                 = "${var.instance_type}"
  user_data                     = "${data.template_file.userdata.rendered}"

  security_groups               = ["${aws_security_group.docker_web_app.id}"]
  enable_monitoring             = false
  associate_public_ip_address   = true
  root_block_device {
    volume_size                 = "${var.volume_size}"
    volume_type                 = "${var.volume_type}"
    delete_on_termination       = true
  }

  lifecycle {
    create_before_destroy       = true
  }
}
