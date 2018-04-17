#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o app_secret.pem $AZ_VAR_app_secret

unzip soln.zip

cat <<EOF > az_credential.tf
provider "azurerm" {
  #ARM_TENANT_ID="$AZ_VAR_tenant_id"
  #ARM_CLIENT_ID="$AZ_VAR_app_id"  
  #ARM_CLIENT_SECRET="$(cat app_secret.pem)"
  tenant_id="$AZ_VAR_tenant_id"
  client_id="$AZ_VAR_app_id"  
  client_secret="$(cat app_secret.pem)"
}
EOF