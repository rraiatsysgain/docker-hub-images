#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o bmcs_api_key.pem $PRIVATE_KEY_URL
curl -o tf_remote_config.tf $TERR_REMOTE_STATE_URL
v=$(unzip soln.zip | grep -m1 'creating:' | cut -d' ' -f5-)
v="$v."
cp -r $v .
echo "Initializing terraform..."
terraform init \
-backend-config="bucket=$TF_VAR_terraform_remote_bucket" \-backend-config="key=$TF_VAR_deployment_auuid/terraform.tfstate" \-backend-config="region=$TF_VAR_terraform_remote_bucket_region" \ 
-backend-config="encrypt=true" \-backend-config="access_key=$TF_VAR_aws_access_key" \-backend-config="secret_key=$TF_VAR_aws_secret_key" \-force-copy 
