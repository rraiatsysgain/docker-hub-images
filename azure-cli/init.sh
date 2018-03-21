
#!/bin/bash

az login --service-principal -u $AZ_VAR_app_id --password "$(cat app_key.pem)" --tenant $AZ_VAR_tenant_id
