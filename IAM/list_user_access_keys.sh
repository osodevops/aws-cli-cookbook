#!/usr/bin/env bash

set -e

# Script finds all the users and show their access keys within the specified account and outputs the keys in to human readable list.

AWS_PROFILE=''

echo "Outputting list of IAM users:"

for user in $(aws iam list-users | jq -r '.Users[] | .UserName') ;
do
    aws iam list-access-keys --user-name "${user}"
done
