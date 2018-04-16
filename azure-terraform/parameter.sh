#env | grep AZ_TEMPLATE_VAR_* > env.txt
#json="{\"\$schema\": \"http://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#\",\"contentVersion\": \"1.0.0.0\",\"parameters\": {"
#while read p; do
#   var=$(echo $p | cut -d'=' -f 1)
#   #key=$(echo ${var##*_})
#   key=$(echo ${var##*_} | awk '{print toupper($0)}')
#   value=$(echo $p | cut -d'=' -f 2)
#   json=$json"\"$key\":{\"value\":\"$value\"},"
#done < env.txt
#json=$json"}}"

#cat <<EOF > azuredeploy.parameters.json
#$json
#EOF