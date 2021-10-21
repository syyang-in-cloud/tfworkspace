IBM_PROD_REGION=('us-south' 'us-east' 'au-syd' 'br-sao' 'ca-tor' 'eu-de' 'eu-gb' 'jp-osa')

for region in "${IBM_PROD_REGION[@]}"
do
	echo $region
	echo "region = \"${region}\"" > ${region}.tfvars
	terraform workspace new $region -no-color
	terraform init -no-color
	terraform apply -no-color -auto-approve -var-file="${region}.tfvars"
	terraform destroy -no-color -auto-approve -var-file="${region}.tfvars"
	terraform workspace select default -no-color
	terraform workspace delete $region -no-color
done
