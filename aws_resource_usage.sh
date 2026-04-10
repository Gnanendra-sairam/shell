#!/bin/bash
###############################################################
# Script is used to get AWS resource in usage
# author : G.Sairam
# date   : 06/10/2024
# version: v1

# this script is used for the following services:
# - EC2
# - S3
# - Lambda
# - RDS
# - DynamoDB
# - EBS
# - VPC
# - CloudFormation
# - CloudWatch
# - IAM
# - CloudTrail
# - SNS
# - SQS
# - CloudFront
# - Route53

# script usage: ./aws_resource_usage.sh <region_name> <service_name>
# example usage: ./aws_resource_usage.sh us-west-2 ec2
###############################################################

# Check if the correct number of arguments is provided
if [ "$#" -ne 2]
then
    echo "usage: $0 <region_name> <service_name>"
    exit 1
fi

# check if aws cli is installed
if ! command -v aws &> /dev/null
then 
    echo "aws cli is not installed. Please install aws cli and try again."
    exit 1
fi

# check if the aws cli is configured
if ! -d ~/.aws
then
    echo "aws cli is not configured. Please configure aws cli and try again."
    exit 1
fi

# exicute the command to get the resource usage based on the service name
if [ "$2" == "ec2" ]  
then
    aws ec2 describe-instances --region $1
elif [ "$2" == "s3" ]
then
    aws s3 ls --region $1
elif [ "$2" == "lambda" ]
then
    aws lambda list-functions --region $1
elif [ "$2" == "rds" ]
then
    aws rds describe-db-instances --region $1
elif [ "$2" == "dynamodb" ]
then
    aws dynamodb list-tables --region $1
elif [ "$2" == "ebs" ]
then
    aws ec2 describe-volumes --region $1
elif [ "$2" == "vpc" ]
then
    aws ec2 describe-vpcs --region $1
elif [ "$2" == "cloudformation" ]
then
    aws cloudformation list-stacks --region $1
elif [ "$2" == "cloudwatch" ]
then
    aws cloudwatch list-metrics --region $1
elif [ "$2" == "iam" ]
then
    aws iam list-users --region $1
elif [ "$2" == "cloudtrail" ]
then
    aws cloudtrail describe-trails --region $1
elif [ "$2" == "sns" ]
then
    aws sns list-topics --region $1
elif [ "$2" == "sqs" ]
then
    aws sqs list-queues --region $1
elif [ "$2" == "cloudfront" ]
then
    aws cloudfront list-distributions --region $1
elif [ "$2" == "route53" ]
then
    aws route53 list-hosted-zones --region $1
else 
    echo "Invalid service name. Please provide a valid service name and try again."
fi