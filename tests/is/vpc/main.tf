provider "ibm" {
  region = var.region
}

data "ibm_resource_group" "this" {
  name = var.ibm_resource_group
}

resource "random_id" "this" {
  byte_length = 2
}

resource "ibm_is_vpc" "this" {
  name           = "${var.prefix}-${var.region}-${random_id.this.hex}-vpc"
  resource_group = data.ibm_resource_group.this.id
}
