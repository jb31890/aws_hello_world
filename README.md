# Terraform Demo: AWS VPC Scenario 2 with docker hello-world

This repo contains a terraform stack that will deploy a new vpc into aws that matches the design laid out in [this aws doc](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html).  It will also create an autoscaling group in the public subnet that will spawn N number of instances.  All instances will execute `docker run hello-world` after checking to ensure docker is installed and running.

# System Requirements
- working awscli installation with a configured credentials file.  Please refer to [this link for more info](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
- working terraform installation.  Please note that this was only tested on v0.10.8.  Please refer to [this link for more info](https://www.terraform.io/intro/getting-started/install.html)

# Getting Started
After cloning the repo, enter the following command, replacing the values in <ALL_CAPS> with your own options.  Below is a list of all variables, their default values, and a description of each variable.  You can customize these variables by either editing config.tf or passing them in as `-var` parameters when running `terraform apply`.
``` 
AWS_PROFILE=<PROFILE_NAME> terraform apply \
-var 'aws_credentials_file=<FULL_PATH_TO_YOUR_CREDENTIAL_FILE>' \
-var 'instance_count=<NUMBER_OF_INSTANCES>'
```

# All Variables
```
variable "aws_credentials_file" {
  type          = "string"
  description   = "path to your aws credentials file"
}

variable "aws_region" {
  type          = "string"
  default       = "us-east-2"
  description   = "sets the aws region to deploy the infrastructure"
}

variable "availability_zone" {
  type          = "string"
  default       = "us-east-2a"
  description   = "sets the availability zone to deploy the infrastructure"
}

variable "vpc_cidr" {
  type          = "string"
  default       = "10.0.0.0/16"
  description   = "sets the ip address range for the vpc"
}

variable "demo_name" {
  type          = "string"
  default       = "Demo-VPC-scenario-2"
  description   = "name tag for demo resources"
}

variable "instance_count" {
  type          = "string"
  default       = "1"
  description   = "sets the desired capacity in the autoscaling group launch config"
}

variable "instance_type" {
  type          = "string"
  default       = "t2.micro"
  description   = "sets the instance type to use in the autoscaling group launch config"
}

variable "volume_type" {
  type          = "string"
  default       = "gp2"
  description   = "sets the volume type to use in the autoscaling group launch config"
}

variable "volume_size" {
  type          = "string"
  default       = "20"
  description   = "sets the volume size to use in the autoscaling group launch config"
}

variable "demo_key" {
  type          = "string"
  default       = "demo.key"
  description   = "key used for ec2 instances"
}
```
