unset IFS
json="{\"\$schema\": \"http://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#\",\"contentVersion\": \"1.0.0.0\",\"parameters\": {"
for var in $(compgen -e); do
    json=$json"\"$var\":{\"value\":\"${!var}\"},"
done
json=$json"}}"

cat <<EOF > azuredeploy.parameters.json
$json
EOF
