#!/usr/bin/env bash
# ./tg_prod_test.sh | tee prod_test.log
#
IBM_PROD_REGION=('us-south' 'us-east' 'au-syd' 'br-sao' 'ca-tor' 'eu-de' 'eu-gb' 'jp-osa')
#IBM_PROD_REGION=('us-south')

for region in "${IBM_PROD_REGION[@]}"
do
	echo $region
	echo "region = \"${region}\"" > ${region}.tfvars
	terraform workspace new $region -no-color
	#export TG_WORKSPACE=$region
done

for region in "${IBM_PROD_REGION[@]}"
do
	echo $region
	terragrunt workspace select $region
	terragrunt plan
	terragrunt apply --auto-approve -var-file="${region}.tfvars"
	terragrunt destroy --auto-approve -var-file="${region}.tfvars"
done

terraform workspace select default -no-color

for region in "${IBM_PROD_REGION[@]}"
do
	echo $region
	terraform workspace delete $region -no-color
	rm ${region}.tfvars
done
