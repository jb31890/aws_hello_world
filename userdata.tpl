#!/usr/bin/env bash
#
# userdata script for ec2 initial boot
# checks for docker installation, installs if not present
# executes 'docker run hello-world'

# check if docker is installed, install if not
check_docker(){
   if [[ ! $(type docker) ]]; then yum install -y docker; fi
}

main(){
  check_docker
  docker run hello-world
}

main
