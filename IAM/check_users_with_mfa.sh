#!/usr/bin/env bash

set -e

usage() {
  echo "Usage: $0 <aws config profile>"
  echo " e.g.: $0 aws_production"
  echo "Make sure you have your AWS CLI configured"
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