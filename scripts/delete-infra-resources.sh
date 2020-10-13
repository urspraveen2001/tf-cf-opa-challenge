#!/bin/bash

aws rds modify-db-instance --db-instance-identifier $3 --no-deletion-protection

aws cloudformation delete-stack --stack-name $4

BUCKET_NAME=$1
TERRAFORM_STATE_FILE_NAME=$2

terraform init -backend-config="bucket=${BUCKET_NAME}" -backend-config="key=${TERRAFORM_STATE_FILE_NAME}"

terraform plan -destroy --out tfplan.binary

terraform apply "tfplan.binary"