#!/bin/bash
curl -o soln.zip $TEMPLATE_URL
curl -o bmcs_api_key.pem $PRIVATE_KEY_URL
curl -o tf_remote_config.tf $TERR_REMOTE_STATE_URL
v=$(unzip soln.zip | grep -m1 'creating:' | cut -d' ' -f5-)
v="$v."
