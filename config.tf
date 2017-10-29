variable "aws_region" {
  type = "string"
  default = "us-east-2"
  description = "sets the aws region to deploy the infrastructure"
}


variable "availability_zone" {
  type = "string"
  default = "us-east-2a"
  description = "sets the availability zone to deploy the infrastructure"
}

variable "vpc_cidr" {
  type = "string"
  default = "10.0.0.0/16"
  description = "sets the ip address range for the vpc"
}

variable "demo_name" {
  type = "string"
  default = "Demo VPC scenario 2"
  description = "name tag for demo resources"
}

variable "instance_count" {
  type = "string"
  default = "1"
  description = "sets the desired capacity in the autoscaling group launch config"
}

variable "instance_type" {
  type = "string"
  default = "t2.micro"
  description = "sets the instance type to use in the autoscaling group launch config"
}

variable "volume_type" {
  type = "string"
  default = "gp2"
  description = "sets the volume type to use in the autoscaling group launch config"
}

variable "volume_size" {
  type = "string"
  default = "20"
  description = "sets the volume size to use in the autoscaling group launch config"
}
