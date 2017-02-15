#!/usr/bin/env bash

set -e

# Script finds all the hosted domains in Route53 and show their names and ID's.

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

aws route53 list-hosted-zones --profile $AWS_PROFILE | jq -r '.HostedZones[] | .Name + ": " + .Id'
