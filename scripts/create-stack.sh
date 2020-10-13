#!/bin/bash

aws cloudformation create-stack --stack-name $1 --template-body file://cf-rds-delete-protection.yaml --capabilities CAPABILITY_NAMED_IAM