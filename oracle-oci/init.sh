curl -o tf_remote_config.tf $TERR_REMOTE_STATE_URL
ls
pwd
echo "Initializing terraform..."
terraform init -input=false -backend-config="address=$TF_VAR_terraform_CONSUL_ADDRESS" -backend-config="path=$TF_VAR_deployment_auuid/terraform.tfstate" -backend-config="scheme=http" -force-copy
