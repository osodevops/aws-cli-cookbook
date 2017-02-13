#!/usr/bin/env bash

set -e

# This script lists 4 components in the following order;
#   1. the subnet ids
#   2. the CIDR block used
#   3. the VPC id associated with the subnet
#   4. the subnet name

usage() {
  echo "Usage: $0 <aws config profile>"
  echo " e.g.: $0 aws_production"
  echo "Make sure your AWS CLI is configured"
  echo " "
  exit 1
}

if [ -z "$1" ];then
  usage
fi

AWS_PROFILE=$1

aws ec2 describe-subnets | jq -r '.Subnets[] | .VpcId + " " + (.Tags[] | select( .Key == "Name" ) | .Value ) + ": " + .SubnetId + " " + .CidrBlock' | sort | awk -F': ' '{print $2 ": " $1}'