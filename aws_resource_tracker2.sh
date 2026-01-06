#!/bin/sh
######################
# Author: Mudit
# Date: 23-Dec
# Version: v1
# Description: AWS resource usage report
######################

set -x

OUTPUT_FILE=/home/ubuntu/resourceTracker2.txt

echo "===== AWS Resource Report =====" > $OUTPUT_FILE
date >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# AWS S3
echo "### S3 Buckets ###" >> $OUTPUT_FILE
aws s3 ls >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# AWS EC2
echo "### EC2 Instances ###" >> $OUTPUT_FILE
aws ec2 describe-instances \
  | jq -r '.Reservations[].Instances[].InstanceId' >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# AWS Lambda
echo "### Lambda Functions ###" >> $OUTPUT_FILE
aws lambda list-functions \
  | jq -r '.Functions[].FunctionName' >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# AWS IAM
echo "### IAM Users ###" >> $OUTPUT_FILE
aws iam list-users \
  | jq -r '.Users[].UserName' >> $OUTPUT_FILE

