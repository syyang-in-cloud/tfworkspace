provider "ibm" {
  region = var.region
}

data "ibm_resource_group" "this" {
  name = var.ibm_resource_group
}

resource "random_id" "this" {
  byte_length = 2
}

# 1. Create an SSH key to be used when a virtual instance (VSI) resource is created.

resource "tls_private_key" "insecure" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

locals {
  ssh_key_public  = tls_private_key.insecure.public_key_openssh
  ssh_key_private = tls_private_key.insecure.private_key_pem
}

resource "ibm_is_ssh_key" "this" {
  name       = "${var.prefix}-${var.region}-${random_id.this.hex}-ssh-key"
  public_key = local.ssh_key_public
}

# the end of 1. Create an SSH key to be used when a virtual instance (VSI) resource is created.

# 2. Create a VPC.

resource "ibm_is_vpc" "this" {
  name           = "${var.prefix}-${var.region}-${random_id.this.hex}-vpc"
  resource_group = data.ibm_resource_group.this.id
}

# the end of 2. Create a VPC.

# 3. Create Address Prefixes (CIDR) for the VPC.
# 3.1 retrieve the zones data source

data "ibm_is_zones" "this" {
  region = var.region
}

# 3.2 retrieve the address prefixes of the VPC created.

data "ibm_is_vpc_address_prefixes" "this" {
  depends_on = [
    ibm_is_vpc.this,
    ibm_is_vpc_address_prefix.first,
    ibm_is_vpc_address_prefix.second
  ]
  vpc = ibm_is_vpc.this.id
}

# 3.3 create the first new address prefix

resource "ibm_is_vpc_address_prefix" "first" {
  zone = data.ibm_is_zones.this.zones[0]
  vpc  = ibm_is_vpc.this.id
  cidr = "10.10.11.0/24"
  name = "${var.prefix}-${var.region}-${random_id.this.hex}-vpc-address-prefix-1"
}


# 3.4 create the second new address prefix

resource "ibm_is_vpc_address_prefix" "second" {
  zone = data.ibm_is_zones.this.zones[0]
  vpc  = ibm_is_vpc.this.id
  cidr = "10.10.12.0/24"
  name = "${var.prefix}-${var.region}-${random_id.this.hex}-vpc-address-prefix-2"
}

# the end of 3. Create Address Prefixes (CIDR) for the VPC.

# 4. Create Subnets
# 4.1 Create subnet1

resource "ibm_is_subnet" "subnet1" {
  name            = "${var.prefix}-${var.region}-${random_id.this.hex}-subnet1"
  vpc             = ibm_is_vpc.this.id
  zone            = data.ibm_is_zones.this.zones[0]
  total_ipv4_address_count = 16384
}
#
# 4.2 Create subnet1
#
resource "ibm_is_subnet" "subnet2" {
  depends_on = [
    ibm_is_subnet.subnet1
  ]
  name            = "${var.prefix}-${var.region}-${random_id.this.hex}-subnet2"
  vpc             = ibm_is_vpc.this.id
  zone            = data.ibm_is_zones.this.zones[0]
  total_ipv4_address_count = 256
}
#
