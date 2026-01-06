#!/bin/sh
######################
# Author: Mudit
#  Date: 23th-Dec
#
#  Version: v1
#
#  This script will report the aws resource usage
######################

set -x

#
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users


# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls > resourceTracker


# list EC2 Instance
echo "Print list of EC2 Instance"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list lambda
echo "Print list of Lambda"
aws lambda list-functions > resourceTracker:q!

# list Iam users
echo "Print list of Iam users"
aws iam list-users

 
