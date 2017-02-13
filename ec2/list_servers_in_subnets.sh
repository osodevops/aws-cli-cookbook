#!/usr/bin/env bash

set -e

# Script lists all the running ec2 instances and also prints out which subnet they belong to and their private IP.

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

aws ec2 describe-instances | jq -r '.Reservations[] | .Instances[] | select( .State | .Name == "running") | .SubnetId + ": " + (.Tags[] | select(.Key == "Name") | .Value) + " " + .PrivateIpAddress' | sort | awk -F': ' '{print $2 ": " $1}'