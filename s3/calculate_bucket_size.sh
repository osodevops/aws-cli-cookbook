#!/bin/sh
set -e

# Script finds all buckets within the speceficed account and outputs the total size together with the number of files contained in the bucket.

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

# find all buckets in the account.
S3_BUCKET_IDS=$(aws s3api list-buckets --profile $AWS_PROFILE --query 'Buckets[*].Name' --output text)

for i in ${S3_BUCKET_IDS[@]}
do
	echo "calculating size of bucket: " $i
  aws s3api --profile $AWS_PROFILE list-objects --bucket $i --output json --query "[sum(Contents[].Size), length(Contents[])]" | awk 'NR!=2 {print $0;next} NR==2 {print $0/1024/1024/1024" GB"}'

done
