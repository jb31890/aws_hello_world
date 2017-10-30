#!/usr/bin/env bash
#
# userdata script for ec2 initial boot
# checks for docker installation, installs if not present
# executes 'docker run hello-world'

set -xeou pipefail

# check if docker is installed, install, start, and enable if not
check_docker(){
   if [[ ! $(type docker) ]]; then yum install -y docker; service docker start; chkconfig docker on; fi
}

main(){
  check_docker
  docker run hello-world
}

main
