#!/usr/bin/env bash

set -e

# Script lists the users that have and have not enabled multi factor authentication on their account in AWS.

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

export AWS_PROFILE=$1

echo "Here is list of IAM users with MFA devices"

for user in $(aws iam list-users | jq -r '.Users[] | .UserName');
do
    aws iam list-mfa-devices --user-name "${user}" | jq -r "\"$user: \" + (.MFADevices | length | tostring)"
done