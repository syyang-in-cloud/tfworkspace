#!/usr/bin/env bash
# ./prod_test_destroy.sh | tee prod_test_destroy.log
IBM_PROD_REGION=('us-south' 'us-east' 'au-syd' 'br-sao' 'ca-tor' 'eu-de' 'eu-gb' 'jp-osa')

for region in "${IBM_PROD_REGION[@]}"
do
	date
	echo $region
	echo "region = \"${region}\"" > ${region}.tfvars
	terraform workspace select $region -no-color
	TF_LOG=debug terraform destroy -no-color -auto-approve -var-file="${region}.tfvars"
	terraform workspace select default
	terraform workspace delete $region -no-color
	rm ${region}.tfvars
done
