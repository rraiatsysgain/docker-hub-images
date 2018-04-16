#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o access_key.pem $TF_VAR_AWS_SECRET_ACCESS_KEY

#v=$(unzip soln.zip | grep -m1 'creating:' | cut -d' ' -f5-)
#v="$v."
#cp -r $v .
unzip soln.zip

#export AWS_ACCESS_KEY_ID=$TF_VAR_AWS_ACCESS_KEY_ID
#export AWS_DEFAULT_REGION=$TF_VAR_AWS_DEFAULT_REGION
#export AWS_SECRET_ACCESS_KEY=$(cat access_key.pem)