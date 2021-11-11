output "vpc" {
  value = ibm_is_vpc.this
}

output "vpc_address_prefixes" {
  value = data.ibm_is_vpc_address_prefixes.this
}
