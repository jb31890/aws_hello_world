resource "aws_autoscaling_group" "docker_asg" {
  name                  = "${var.demo_name}_docker_asg"

  lifecycle {
    ignore_changes      = ["name"]
  }

  min_size              = 0
  max_size              = "${var.instance_count}"
  desired_capacity      = "${var.instance_count}"
  
  vpc_zone_identifier   = ["${aws_subnet.public.id}"]
  health_check_type     = "EC2"
  launch_configuration  = "${aws_launch_configuration.docker_lc.id}"

  tag {
    key                 = "Name"
    value               = "${var.demo_name}"
    propagate_at_launch = true
  }
}
