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
  depends_on = [
    ibm_is_vpc_address_prefix.first
  ]
  name            = "${var.prefix}-${var.region}-${random_id.this.hex}-subnet1"
  vpc             = ibm_is_vpc.this.id
  zone            = data.ibm_is_zones.this.zones[0]
  ipv4_cidr_block = "10.10.11.0/24"
}

# 4.2 Create subnet1

resource "ibm_is_subnet" "subnet2" {
  depends_on = [
    ibm_is_vpc_address_prefix.second
  ]
  name            = "${var.prefix}-${var.region}-${random_id.this.hex}-subnet2"
  vpc             = ibm_is_vpc.this.id
  zone            = data.ibm_is_zones.this.zones[0]
  ipv4_cidr_block = "10.10.12.0/24"
}

# the end of 4. Create Subnets

# 5. Choose a profile and an image to create a Virtual Server Instance (VSI)
#
## profile: bx2-4x16
## image: ibm-ubuntu-18-04-5-minimal-amd64-1
#
# the end of 5. Choose a profile and an image to create a Virtual Server Instance (VSI)

data ibm_is_image "ubuntu-18-04-5" {
  name = "ibm-ubuntu-18-04-5-minimal-amd64-1"
}

data ibm_is_image "mysql" {
  name = "ubuntu-focal-docker-mysql-0-1-0-54f0"
  visibility = "private"
}

data ibm_is_image "wordpress" {
  name = "ubuntu-focal-docker-wordpress-0-1-0-42e4"
  visibility = "private"
}

# 6. Create VPC VSIs.
# 6.1 the security group for the VSIs: app_sg

resource "ibm_is_security_group" "app_sg" {
  name = "${var.prefix}-${var.region}-${random_id.this.hex}-security-group-app-sg"
  vpc  = ibm_is_vpc.this.id
}

# 6.2 the security group rules for the security group

resource "ibm_is_security_group_rule" "http" {
  group     = ibm_is_security_group.app_sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "app_sg_ssh" {
  group     = ibm_is_security_group.app_sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

# 6.3 the security group for the VSIs: data_sg

resource "ibm_is_security_group" "data_sg" {
  name = "${var.prefix}-${var.region}-${random_id.this.hex}-security-group-data-sg"
  vpc  = ibm_is_vpc.this.id
}

# 6.4 the security group rules for the security group

resource "ibm_is_security_group_rule" "mysql" {
  group     = ibm_is_security_group.data_sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 3306
    port_max = 3306
  }
}

resource "ibm_is_security_group_rule" "data_sg_ssh" {
  group     = ibm_is_security_group.data_sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

# 6.5 Create Data Tier VPC Instances - Sbunet2

resource "ibm_is_instance" "mysql" {
  count   = var.count_mysql
  name    = "${var.prefix}-${var.region}-${random_id.this.hex}-in-mysql${count.index}"
  #image   = "r006-9de77234-3189-42f8-982d-f2266477cfe0"
  image   = data.ibm_is_image.mysql.id
  profile = "bx2-4x16"
  vpc     = ibm_is_vpc.this.id
  zone    = data.ibm_is_zones.this.zones[0]
  keys    = [
    ibm_is_ssh_key.this.id
  ]


  primary_network_interface {
    subnet = ibm_is_subnet.subnet2.id
    security_groups = [
      ibm_is_security_group.data_sg.id
    ]
  }

  #connection {
  #  type = "ssh"
  #  user = "ubuntu"
  #  host = self.primary_network_interface[0].primary_ipv4_address
  #  private_key = local.ssh-key-private
  #}
  #
  #provisioner "remote-exec" {
  #  inline = ["echo $(uname -a)"]
  #}
}

# 6.6 Create Web and Application tier VPC instances - Subnet1

resource "ibm_is_instance" "appserv" {
  count   = var.count_appserv
  name    = "${var.prefix}-${var.region}-${random_id.this.hex}-in-appserv${count.index}"
  #image   = "r006-9de77234-3189-42f8-982d-f2266477cfe0"
  image   = data.ibm_is_image.wordpress.id
  profile = "bx2-4x16"
  vpc     = ibm_is_vpc.this.id
  zone    = data.ibm_is_zones.this.zones[0]
  keys    = [
    ibm_is_ssh_key.this.id
  ]


  primary_network_interface {
    subnet = ibm_is_subnet.subnet1.id
    security_groups = [
      ibm_is_security_group.app_sg.id
    ]
  }

  network_interfaces {
    name   = "eth1"
    subnet = ibm_is_subnet.subnet2.id
    security_groups = [
      ibm_is_security_group.data_sg.id
    ]
  }
}

# the end of 6. Create VPC VSIs.

# 7. Create and configure a Load Balancer.

resource ibm_is_lb "lb1" {
  name       = "${var.prefix}-${var.region}-${random_id.this.hex}-lb-lb1"
  subnets    = [
    ibm_is_subnet.subnet1.id
  ]

  timeouts {
    create = "60m"
    delete = "60m"
  }
}
resource ibm_is_lb_pool "pool1" {
  depends_on         = [ibm_is_lb.lb1]
  lb                 = ibm_is_lb.lb1.id
  name               = "${var.prefix}-${var.region}-${random_id.this.hex}-lbpool-pool1"
  protocol           = "http"
  algorithm          = "round_robin"
  health_delay       = "20"
  health_retries     = "2"
  health_timeout     = "2"
  health_type        = "http"
  health_monitor_url = "/"
}

resource ibm_is_lb_pool_member "pool1_member" {
  depends_on     = [
    ibm_is_lb.lb1,
    ibm_is_lb_pool.pool1,
    ibm_is_instance.appserv
  ]
  count          = var.count_appserv
  lb             = ibm_is_lb.lb1.id
  pool           = ibm_is_lb_pool.pool1.id
  port           = 80
  target_address = ibm_is_instance.appserv[count.index].primary_network_interface[0].primary_ipv4_address
}

resource ibm_is_lb_listener "lb_listener" {
  depends_on   = [ibm_is_lb_pool.pool1]
  lb           = ibm_is_lb.lb1.id
  port         = "80"
  protocol     = "http"
  default_pool = ibm_is_lb_pool.pool1.id
}

# the end of 7. Create and configure a Load Balancer.

# 8. Create Floating IPs and assign them to the VSIs
# This is waste from the lack of custom image; I'll try to build custom images later
# the end of 8. Create Floating IPs and assign them to the VSIs

# 9. Add rules to the VPC's default Security Group
#########1#########2#########3#########4#########5#########6#########7#########8

resource "ibm_is_security_group_rule" "df_icmp" {
  group     = ibm_is_vpc.this.default_security_group
  direction = "inbound"
  remote    = "0.0.0.0/0"

  icmp {
    code = 0
    type = 8
  }
}

resource "ibm_is_security_group_rule" "df_http" {
  group     = ibm_is_vpc.this.default_security_group
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "df_ssh" {
  group     = ibm_is_vpc.this.default_security_group
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

# the end of 9. Add rules to the VPC's default Security Group
