resource "template_file" "userdata" {
  template = "userdata.tpl"
}

resource "aws_launch_configuration" "docker_lc" {
  name_prefix = "${var.demo_name}"
  key_name = "${var.demo_key}"
  image_id = "${var.ami}"
  instance_type = "${var.instance_type}"
  user_data = "${template_file.userdata.rendered}"

  security_groups = "${aws_security_group.docker_web_app}"
  enable_monitoring = false
  associate_public_ip_address = false
  root_block_device {
    volume_size = "${var.volume_size}"
    volume_type = "${var.volume_type}"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
