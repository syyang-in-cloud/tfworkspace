#!/usr/bin/env bash
# ./prod_test.sh | tee prod_test.log
#IBM_PROD_REGION=('us-south' 'us-east' 'au-syd' 'br-sao' 'ca-tor' 'eu-de' 'eu-gb' 'jp-osa')
#IBM_PROD_REGION=('us-east')
#IBM_PROD_REGION=('jp-osa')
IBM_PROD_REGION=('us-south')

for i in {1..1}
do

	echo "Trial: $i"

	for region in "${IBM_PROD_REGION[@]}"
	do
		echo $region
		echo "region = \"${region}\"" > ${region}.tfvars
		terraform workspace new $region -no-color
	done

	for region in "${IBM_PROD_REGION[@]}"
	do
		echo $region
		terraform workspace select $region -no-color
		terraform init -no-color
		terraform apply -no-color -auto-approve -var-file="${region}.tfvars"
		terraform destroy -no-color -auto-approve -var-file="${region}.tfvars"
	done

	terraform workspace select default -no-color

	for region in "${IBM_PROD_REGION[@]}"
	do
		echo $region
		terraform workspace delete $region -no-color
		rm ${region}.tfvars
	done

done
