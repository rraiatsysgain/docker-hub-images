#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o oci_api_key.pem $PRIVATE_KEY_URL
v=$(unzip soln.zip | grep -m1 'creating:' | cut -d' ' -f5-)
v="$v."
cp -r $v .
