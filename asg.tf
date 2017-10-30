resource "aws_autoscaling_group" "docker_asg" {
  name = 

  lifecycle {
    ignore_changes = ["name"]
  }

  min_size = 
  max_size = 
  desired_capacity = 
  
  vpc_zone_identifier = 
  load_balancers = 
  health_check_type =
  launch_configuration = 

  tag {

  }

  tag {

  }

  tag {

  }

}
