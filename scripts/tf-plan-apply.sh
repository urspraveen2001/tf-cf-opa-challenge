#!/bin/bash
BUCKET_NAME=$1
TERRAFORM_STATE_FILE_NAME=$2
TFVARS_SUBNET_REGION=$3
# echo ${TFVARS_SUBNET_REGION}
# echo ${BUCKET_NAME}
terraform init -backend-config="bucket=${BUCKET_NAME}" -backend-config="key=${TERRAFORM_STATE_FILE_NAME}"

terraform plan -var "subnet1_region=${TFVARS_SUBNET_REGION}" --out tfplan.binary

terraform show -json tfplan.binary > tfplan.json

opa eval --format pretty --data terraform.rego --input tfplan.json "data.terraform.analysis.authz"

OPA_Result=`docker run -v $PWD:/terraform openpolicyagent/opa:0.23.2-istio-2 eval --format pretty --data /terraform/terraform.rego --input /terraform/tfplan.json  'data.terraform.analysis.authz'`

if [ "${OPA_Result}" = "false" ]; then
    echo "You cannot modify the subnet once created"
    exit 1
fi

terraform apply "tfplan.binary"