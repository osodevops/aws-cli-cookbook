#!/usr/bin/env bash

set -e

# Script finds all the users and show their access keys within the specified account and outputs the keys in to human readable list.

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

echo "Here is a list of IAM users on the account:"

for user in $(aws iam list-users --profile $AWS_PROFILE | jq -r '.Users[] | .UserName') ;
do
    aws iam list-access-keys --profile $AWS_PROFILE --user-name "${user}"
done
