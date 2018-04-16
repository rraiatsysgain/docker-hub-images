#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o app_secret.pem $AZ_VAR_app_secret

export ARM_TENANT_ID=$AZ_VAR_tenant_id
export ARM_CLIENT_ID=$AZ_VAR_app_id
export ARM_CLIENT_SECRET=$(cat app_secret.pem)
#v=$(unzip soln.zip | grep -m1 'creating:' | cut -d' ' -f5-)
#v="$v."
#cp -r $v .
unzip soln.zip
