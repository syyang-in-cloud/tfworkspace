# tfworkspace practice

## Pre-requisite

* [IBMCLOUD](cloud.ibm.com) account and API KEY
* Terraform version 1.0 or later

```
$ export IBMCLOUD_API_KEY=<YOUR IBMCLOUD API KEY>
$ ./prod_test.sh | tee prod_test.log
us-south
Created and switched to workspace "us-south"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
us-east
Created and switched to workspace "us-east"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
us-south
Switched to workspace "us-south".

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file
- Reusing previous version of ibm-cloud/ibm from the dependency lock file
- Using previously-installed hashicorp/random v3.1.0
- Using previously-installed ibm-cloud/ibm v1.34.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # ibm_is_vpc.this will be created
  + resource "ibm_is_vpc" "this" {
      + address_prefix_management   = "auto"
      + classic_access              = false
      + crn                         = (known after apply)
      + cse_source_addresses        = (known after apply)
      + default_network_acl         = (known after apply)
      + default_network_acl_crn     = (known after apply)
      + default_network_acl_name    = (known after apply)
      + default_routing_table       = (known after apply)
      + default_routing_table_name  = (known after apply)
      + default_security_group      = (known after apply)
      + default_security_group_crn  = (known after apply)
      + default_security_group_name = (known after apply)
      + id                          = (known after apply)
      + name                        = (known after apply)
      + resource_controller_url     = (known after apply)
      + resource_crn                = (known after apply)
      + resource_group              = "bc26f31742114cd1832097a1db493ac0"
      + resource_group_name         = (known after apply)
      + resource_name               = (known after apply)
      + resource_status             = (known after apply)
      + security_group              = (known after apply)
      + status                      = (known after apply)
      + subnets                     = (known after apply)
      + tags                        = (known after apply)
    }

  # random_id.this will be created
  + resource "random_id" "this" {
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 2
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vpc = {
      + address_prefix_management   = "auto"
      + classic_access              = false
      + crn                         = (known after apply)
      + cse_source_addresses        = (known after apply)
      + default_network_acl         = (known after apply)
      + default_network_acl_crn     = (known after apply)
      + default_network_acl_name    = (known after apply)
      + default_routing_table       = (known after apply)
      + default_routing_table_name  = (known after apply)
      + default_security_group      = (known after apply)
      + default_security_group_crn  = (known after apply)
      + default_security_group_name = (known after apply)
      + id                          = (known after apply)
      + name                        = (known after apply)
      + resource_controller_url     = (known after apply)
      + resource_crn                = (known after apply)
      + resource_group              = "bc26f31742114cd1832097a1db493ac0"
      + resource_group_name         = (known after apply)
      + resource_name               = (known after apply)
      + resource_status             = (known after apply)
      + security_group              = (known after apply)
      + status                      = (known after apply)
      + subnets                     = (known after apply)
      + tags                        = (known after apply)
      + timeouts                    = null
    }
random_id.this: Creating...
random_id.this: Creation complete after 0s [id=L-o]
ibm_is_vpc.this: Creating...
ibm_is_vpc.this: Still creating... [10s elapsed]
ibm_is_vpc.this: Creation complete after 16s [id=r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

vpc = {
  "address_prefix_management" = "auto"
  "classic_access" = false
  "crn" = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::vpc:r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7"
  "cse_source_addresses" = tolist([
    {
      "address" = "10.16.239.224"
      "zone_name" = "us-south-1"
    },
    {
      "address" = "10.16.245.45"
      "zone_name" = "us-south-2"
    },
    {
      "address" = "10.12.165.236"
      "zone_name" = "us-south-3"
    },
  ])
  "default_network_acl" = "r006-7e6628af-7bb3-439d-ab88-a582c70e625d"
  "default_network_acl_crn" = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::network-acl:r006-7e6628af-7bb3-439d-ab88-a582c70e625d"
  "default_network_acl_name" = "wanted-reborn-hurled-vending"
  "default_routing_table" = "r006-99ded200-65be-438b-905c-7c778c73a575"
  "default_routing_table_name" = "coveting-gumminess-parking-scorpions"
  "default_security_group" = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
  "default_security_group_crn" = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::security-group:r006-04cbffcd-334f-4553-967b-1298f9072eaf"
  "default_security_group_name" = "fancied-self-clanking-plywood"
  "id" = "r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7"
  "name" = "prefix-us-south-2fea-vpc"
  "resource_controller_url" = "https://cloud.ibm.com/vpc-ext/network/vpcs"
  "resource_crn" = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::vpc:r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7"
  "resource_group" = "bc26f31742114cd1832097a1db493ac0"
  "resource_group_name" = "Default"
  "resource_name" = "prefix-us-south-2fea-vpc"
  "resource_status" = "available"
  "security_group" = tolist([
    {
      "group_id" = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
      "group_name" = "fancied-self-clanking-plywood"
      "rules" = tolist([
        {
          "code" = 0
          "direction" = "outbound"
          "ip_version" = "ipv4"
          "port_max" = 0
          "port_min" = 0
          "protocol" = "all"
          "remote" = "0.0.0.0/0"
          "rule_id" = "r006-84b49eae-e85e-44a5-826d-2e23b3c18af8"
          "type" = 0
        },
        {
          "code" = 0
          "direction" = "inbound"
          "ip_version" = "ipv4"
          "port_max" = 0
          "port_min" = 0
          "protocol" = "all"
          "remote" = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
          "rule_id" = "r006-b2a1689d-c05e-4da9-acd7-b519fbb9bbeb"
          "type" = 0
        },
      ])
    },
  ])
  "status" = "available"
  "subnets" = tolist([])
  "tags" = toset([])
  "timeouts" = null /* object */
}
random_id.this: Refreshing state... [id=L-o]
ibm_is_vpc.this: Refreshing state... [id=r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # ibm_is_vpc.this will be destroyed
  - resource "ibm_is_vpc" "this" {
      - address_prefix_management   = "auto" -> null
      - classic_access              = false -> null
      - crn                         = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::vpc:r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7" -> null
      - cse_source_addresses        = [
          - {
              - address   = "10.16.239.224"
              - zone_name = "us-south-1"
            },
          - {
              - address   = "10.16.245.45"
              - zone_name = "us-south-2"
            },
          - {
              - address   = "10.12.165.236"
              - zone_name = "us-south-3"
            },
        ] -> null
      - default_network_acl         = "r006-7e6628af-7bb3-439d-ab88-a582c70e625d" -> null
      - default_network_acl_crn     = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::network-acl:r006-7e6628af-7bb3-439d-ab88-a582c70e625d" -> null
      - default_network_acl_name    = "wanted-reborn-hurled-vending" -> null
      - default_routing_table       = "r006-99ded200-65be-438b-905c-7c778c73a575" -> null
      - default_routing_table_name  = "coveting-gumminess-parking-scorpions" -> null
      - default_security_group      = "r006-04cbffcd-334f-4553-967b-1298f9072eaf" -> null
      - default_security_group_crn  = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::security-group:r006-04cbffcd-334f-4553-967b-1298f9072eaf" -> null
      - default_security_group_name = "fancied-self-clanking-plywood" -> null
      - id                          = "r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7" -> null
      - name                        = "prefix-us-south-2fea-vpc" -> null
      - resource_controller_url     = "https://cloud.ibm.com/vpc-ext/network/vpcs" -> null
      - resource_crn                = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::vpc:r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7" -> null
      - resource_group              = "bc26f31742114cd1832097a1db493ac0" -> null
      - resource_group_name         = "Default" -> null
      - resource_name               = "prefix-us-south-2fea-vpc" -> null
      - resource_status             = "available" -> null
      - security_group              = [
          - {
              - group_id   = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
              - group_name = "fancied-self-clanking-plywood"
              - rules      = [
                  - {
                      - code       = 0
                      - direction  = "outbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "0.0.0.0/0"
                      - rule_id    = "r006-84b49eae-e85e-44a5-826d-2e23b3c18af8"
                      - type       = 0
                    },
                  - {
                      - code       = 0
                      - direction  = "inbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
                      - rule_id    = "r006-b2a1689d-c05e-4da9-acd7-b519fbb9bbeb"
                      - type       = 0
                    },
                ]
            },
        ] -> null
      - status                      = "available" -> null
      - subnets                     = [] -> null
      - tags                        = [] -> null
    }

  # random_id.this will be destroyed
  - resource "random_id" "this" {
      - b64_std     = "L+o=" -> null
      - b64_url     = "L-o" -> null
      - byte_length = 2 -> null
      - dec         = "12266" -> null
      - hex         = "2fea" -> null
      - id          = "L-o" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Changes to Outputs:
  - vpc = {
      - address_prefix_management   = "auto"
      - classic_access              = false
      - crn                         = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::vpc:r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7"
      - cse_source_addresses        = [
          - {
              - address   = "10.16.239.224"
              - zone_name = "us-south-1"
            },
          - {
              - address   = "10.16.245.45"
              - zone_name = "us-south-2"
            },
          - {
              - address   = "10.12.165.236"
              - zone_name = "us-south-3"
            },
        ]
      - default_network_acl         = "r006-7e6628af-7bb3-439d-ab88-a582c70e625d"
      - default_network_acl_crn     = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::network-acl:r006-7e6628af-7bb3-439d-ab88-a582c70e625d"
      - default_network_acl_name    = "wanted-reborn-hurled-vending"
      - default_routing_table       = "r006-99ded200-65be-438b-905c-7c778c73a575"
      - default_routing_table_name  = "coveting-gumminess-parking-scorpions"
      - default_security_group      = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
      - default_security_group_crn  = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::security-group:r006-04cbffcd-334f-4553-967b-1298f9072eaf"
      - default_security_group_name = "fancied-self-clanking-plywood"
      - id                          = "r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7"
      - name                        = "prefix-us-south-2fea-vpc"
      - resource_controller_url     = "https://cloud.ibm.com/vpc-ext/network/vpcs"
      - resource_crn                = "crn:v1:bluemix:public:is:us-south:a/02a436df417a4524856729a373535c8b::vpc:r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7"
      - resource_group              = "bc26f31742114cd1832097a1db493ac0"
      - resource_group_name         = "Default"
      - resource_name               = "prefix-us-south-2fea-vpc"
      - resource_status             = "available"
      - security_group              = [
          - {
              - group_id   = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
              - group_name = "fancied-self-clanking-plywood"
              - rules      = [
                  - {
                      - code       = 0
                      - direction  = "outbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "0.0.0.0/0"
                      - rule_id    = "r006-84b49eae-e85e-44a5-826d-2e23b3c18af8"
                      - type       = 0
                    },
                  - {
                      - code       = 0
                      - direction  = "inbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "r006-04cbffcd-334f-4553-967b-1298f9072eaf"
                      - rule_id    = "r006-b2a1689d-c05e-4da9-acd7-b519fbb9bbeb"
                      - type       = 0
                    },
                ]
            },
        ]
      - status                      = "available"
      - subnets                     = []
      - tags                        = []
      - timeouts                    = null
    } -> null
ibm_is_vpc.this: Destroying... [id=r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7]
ibm_is_vpc.this: Still destroying... [id=r006-c1faeaae-f4b2-4aea-ae90-05a3e69122b7, 10s elapsed]
ibm_is_vpc.this: Destruction complete after 12s
random_id.this: Destroying... [id=L-o]
random_id.this: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
us-east
Switched to workspace "us-east".

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of ibm-cloud/ibm from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Using previously-installed ibm-cloud/ibm v1.34.0
- Using previously-installed hashicorp/random v3.1.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # ibm_is_vpc.this will be created
  + resource "ibm_is_vpc" "this" {
      + address_prefix_management   = "auto"
      + classic_access              = false
      + crn                         = (known after apply)
      + cse_source_addresses        = (known after apply)
      + default_network_acl         = (known after apply)
      + default_network_acl_crn     = (known after apply)
      + default_network_acl_name    = (known after apply)
      + default_routing_table       = (known after apply)
      + default_routing_table_name  = (known after apply)
      + default_security_group      = (known after apply)
      + default_security_group_crn  = (known after apply)
      + default_security_group_name = (known after apply)
      + id                          = (known after apply)
      + name                        = (known after apply)
      + resource_controller_url     = (known after apply)
      + resource_crn                = (known after apply)
      + resource_group              = "bc26f31742114cd1832097a1db493ac0"
      + resource_group_name         = (known after apply)
      + resource_name               = (known after apply)
      + resource_status             = (known after apply)
      + security_group              = (known after apply)
      + status                      = (known after apply)
      + subnets                     = (known after apply)
      + tags                        = (known after apply)
    }

  # random_id.this will be created
  + resource "random_id" "this" {
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 2
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vpc = {
      + address_prefix_management   = "auto"
      + classic_access              = false
      + crn                         = (known after apply)
      + cse_source_addresses        = (known after apply)
      + default_network_acl         = (known after apply)
      + default_network_acl_crn     = (known after apply)
      + default_network_acl_name    = (known after apply)
      + default_routing_table       = (known after apply)
      + default_routing_table_name  = (known after apply)
      + default_security_group      = (known after apply)
      + default_security_group_crn  = (known after apply)
      + default_security_group_name = (known after apply)
      + id                          = (known after apply)
      + name                        = (known after apply)
      + resource_controller_url     = (known after apply)
      + resource_crn                = (known after apply)
      + resource_group              = "bc26f31742114cd1832097a1db493ac0"
      + resource_group_name         = (known after apply)
      + resource_name               = (known after apply)
      + resource_status             = (known after apply)
      + security_group              = (known after apply)
      + status                      = (known after apply)
      + subnets                     = (known after apply)
      + tags                        = (known after apply)
      + timeouts                    = null
    }
random_id.this: Creating...
random_id.this: Creation complete after 0s [id=11M]
ibm_is_vpc.this: Creating...
ibm_is_vpc.this: Still creating... [10s elapsed]
ibm_is_vpc.this: Creation complete after 15s [id=r014-547cea2f-7ed9-4714-a88c-af89df0add33]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

vpc = {
  "address_prefix_management" = "auto"
  "classic_access" = false
  "crn" = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::vpc:r014-547cea2f-7ed9-4714-a88c-af89df0add33"
  "cse_source_addresses" = tolist([
    {
      "address" = "10.249.91.206"
      "zone_name" = "us-east-1"
    },
    {
      "address" = "10.12.104.71"
      "zone_name" = "us-east-2"
    },
    {
      "address" = "10.12.112.70"
      "zone_name" = "us-east-3"
    },
  ])
  "default_network_acl" = "r014-780af218-47ca-4bf9-ba36-6d33bc883526"
  "default_network_acl_crn" = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::network-acl:r014-780af218-47ca-4bf9-ba36-6d33bc883526"
  "default_network_acl_name" = "brain-only-sandfish-starter"
  "default_routing_table" = "r014-801827aa-c907-471d-a8a8-346a6b7d241c"
  "default_routing_table_name" = "litmus-urgency-reggae-exporter"
  "default_security_group" = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
  "default_security_group_crn" = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::security-group:r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
  "default_security_group_name" = "fable-enlisted-twenty-unifier"
  "id" = "r014-547cea2f-7ed9-4714-a88c-af89df0add33"
  "name" = "prefix-us-east-d753-vpc"
  "resource_controller_url" = "https://cloud.ibm.com/vpc-ext/network/vpcs"
  "resource_crn" = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::vpc:r014-547cea2f-7ed9-4714-a88c-af89df0add33"
  "resource_group" = "bc26f31742114cd1832097a1db493ac0"
  "resource_group_name" = "Default"
  "resource_name" = "prefix-us-east-d753-vpc"
  "resource_status" = "available"
  "security_group" = tolist([
    {
      "group_id" = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
      "group_name" = "fable-enlisted-twenty-unifier"
      "rules" = tolist([
        {
          "code" = 0
          "direction" = "outbound"
          "ip_version" = "ipv4"
          "port_max" = 0
          "port_min" = 0
          "protocol" = "all"
          "remote" = "0.0.0.0/0"
          "rule_id" = "r014-bb2e4a19-2431-4382-a533-071aa2443888"
          "type" = 0
        },
        {
          "code" = 0
          "direction" = "inbound"
          "ip_version" = "ipv4"
          "port_max" = 0
          "port_min" = 0
          "protocol" = "all"
          "remote" = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
          "rule_id" = "r014-7555a12c-f8c5-4edd-85a4-6651c55c68cc"
          "type" = 0
        },
      ])
    },
  ])
  "status" = "available"
  "subnets" = tolist([])
  "tags" = toset([])
  "timeouts" = null /* object */
}
random_id.this: Refreshing state... [id=11M]
ibm_is_vpc.this: Refreshing state... [id=r014-547cea2f-7ed9-4714-a88c-af89df0add33]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # ibm_is_vpc.this will be destroyed
  - resource "ibm_is_vpc" "this" {
      - address_prefix_management   = "auto" -> null
      - classic_access              = false -> null
      - crn                         = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::vpc:r014-547cea2f-7ed9-4714-a88c-af89df0add33" -> null
      - cse_source_addresses        = [
          - {
              - address   = "10.249.91.206"
              - zone_name = "us-east-1"
            },
          - {
              - address   = "10.12.104.71"
              - zone_name = "us-east-2"
            },
          - {
              - address   = "10.12.112.70"
              - zone_name = "us-east-3"
            },
        ] -> null
      - default_network_acl         = "r014-780af218-47ca-4bf9-ba36-6d33bc883526" -> null
      - default_network_acl_crn     = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::network-acl:r014-780af218-47ca-4bf9-ba36-6d33bc883526" -> null
      - default_network_acl_name    = "brain-only-sandfish-starter" -> null
      - default_routing_table       = "r014-801827aa-c907-471d-a8a8-346a6b7d241c" -> null
      - default_routing_table_name  = "litmus-urgency-reggae-exporter" -> null
      - default_security_group      = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd" -> null
      - default_security_group_crn  = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::security-group:r014-b2861bfe-6baf-4ada-977f-43fc624e91dd" -> null
      - default_security_group_name = "fable-enlisted-twenty-unifier" -> null
      - id                          = "r014-547cea2f-7ed9-4714-a88c-af89df0add33" -> null
      - name                        = "prefix-us-east-d753-vpc" -> null
      - resource_controller_url     = "https://cloud.ibm.com/vpc-ext/network/vpcs" -> null
      - resource_crn                = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::vpc:r014-547cea2f-7ed9-4714-a88c-af89df0add33" -> null
      - resource_group              = "bc26f31742114cd1832097a1db493ac0" -> null
      - resource_group_name         = "Default" -> null
      - resource_name               = "prefix-us-east-d753-vpc" -> null
      - resource_status             = "available" -> null
      - security_group              = [
          - {
              - group_id   = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
              - group_name = "fable-enlisted-twenty-unifier"
              - rules      = [
                  - {
                      - code       = 0
                      - direction  = "outbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "0.0.0.0/0"
                      - rule_id    = "r014-bb2e4a19-2431-4382-a533-071aa2443888"
                      - type       = 0
                    },
                  - {
                      - code       = 0
                      - direction  = "inbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
                      - rule_id    = "r014-7555a12c-f8c5-4edd-85a4-6651c55c68cc"
                      - type       = 0
                    },
                ]
            },
        ] -> null
      - status                      = "available" -> null
      - subnets                     = [] -> null
      - tags                        = [] -> null
    }

  # random_id.this will be destroyed
  - resource "random_id" "this" {
      - b64_std     = "11M=" -> null
      - b64_url     = "11M" -> null
      - byte_length = 2 -> null
      - dec         = "55123" -> null
      - hex         = "d753" -> null
      - id          = "11M" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Changes to Outputs:
  - vpc = {
      - address_prefix_management   = "auto"
      - classic_access              = false
      - crn                         = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::vpc:r014-547cea2f-7ed9-4714-a88c-af89df0add33"
      - cse_source_addresses        = [
          - {
              - address   = "10.249.91.206"
              - zone_name = "us-east-1"
            },
          - {
              - address   = "10.12.104.71"
              - zone_name = "us-east-2"
            },
          - {
              - address   = "10.12.112.70"
              - zone_name = "us-east-3"
            },
        ]
      - default_network_acl         = "r014-780af218-47ca-4bf9-ba36-6d33bc883526"
      - default_network_acl_crn     = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::network-acl:r014-780af218-47ca-4bf9-ba36-6d33bc883526"
      - default_network_acl_name    = "brain-only-sandfish-starter"
      - default_routing_table       = "r014-801827aa-c907-471d-a8a8-346a6b7d241c"
      - default_routing_table_name  = "litmus-urgency-reggae-exporter"
      - default_security_group      = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
      - default_security_group_crn  = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::security-group:r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
      - default_security_group_name = "fable-enlisted-twenty-unifier"
      - id                          = "r014-547cea2f-7ed9-4714-a88c-af89df0add33"
      - name                        = "prefix-us-east-d753-vpc"
      - resource_controller_url     = "https://cloud.ibm.com/vpc-ext/network/vpcs"
      - resource_crn                = "crn:v1:bluemix:public:is:us-east:a/02a436df417a4524856729a373535c8b::vpc:r014-547cea2f-7ed9-4714-a88c-af89df0add33"
      - resource_group              = "bc26f31742114cd1832097a1db493ac0"
      - resource_group_name         = "Default"
      - resource_name               = "prefix-us-east-d753-vpc"
      - resource_status             = "available"
      - security_group              = [
          - {
              - group_id   = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
              - group_name = "fable-enlisted-twenty-unifier"
              - rules      = [
                  - {
                      - code       = 0
                      - direction  = "outbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "0.0.0.0/0"
                      - rule_id    = "r014-bb2e4a19-2431-4382-a533-071aa2443888"
                      - type       = 0
                    },
                  - {
                      - code       = 0
                      - direction  = "inbound"
                      - ip_version = "ipv4"
                      - port_max   = 0
                      - port_min   = 0
                      - protocol   = "all"
                      - remote     = "r014-b2861bfe-6baf-4ada-977f-43fc624e91dd"
                      - rule_id    = "r014-7555a12c-f8c5-4edd-85a4-6651c55c68cc"
                      - type       = 0
                    },
                ]
            },
        ]
      - status                      = "available"
      - subnets                     = []
      - tags                        = []
      - timeouts                    = null
    } -> null
ibm_is_vpc.this: Destroying... [id=r014-547cea2f-7ed9-4714-a88c-af89df0add33]
ibm_is_vpc.this: Still destroying... [id=r014-547cea2f-7ed9-4714-a88c-af89df0add33, 10s elapsed]
ibm_is_vpc.this: Destruction complete after 11s
random_id.this: Destroying... [id=11M]
random_id.this: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
Switched to workspace "default".
us-south
Deleted workspace "us-south"!
us-east
Deleted workspace "us-east"!
```
