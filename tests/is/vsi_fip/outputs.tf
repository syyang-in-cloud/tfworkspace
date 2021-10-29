output "vpc" {
  value = ibm_is_vpc.this
}

output "ssh_key_public" {
  value = local.ssh_key_public
  sensitive = true
}
