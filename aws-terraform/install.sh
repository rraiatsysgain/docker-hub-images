#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o access_key.pem $TF_VAR_AWS_SECRET_ACCESS_KEY

unzip soln.zip

cat <<EOF > aws_credential.tf
provider "aws" {
  region="$TF_VAR_AWS_DEFAULT_REGION"
  access_key="$TF_VAR_AWS_ACCESS_KEY_ID"
  secret_key="$TF_VAR_AWS_SECRET_ACCESS_KEY"
  #secret_key="$(cat access_key.pem)"
}
EOF