curl -o tf_remote_config.tf $TERRAFORM_CONSUL_BACKEND_FILE
ls
pwd
echo "Initializing terraform..."
terraform init -input=false -backend-config="address=$TERRAFORM_CONSUL_ADDRESS" -backend-config="path=$TF_VAR_deployment_auuid/terraform.tfstate" -backend-config="scheme=$TERRAFORM_CONSUL_SCHEME" -force-copy
