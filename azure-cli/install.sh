#!/bin/bash
wget $TEMPLATE_URL -O soln.zip

unzip soln.zip
wget $AZ_VAR_app_secret -O app_key.pem
#v=$(unzip soln.zip | grep -m1 'creating:' | cut -d' ' -f5-)
#v="$v."
#cp -r $v .
