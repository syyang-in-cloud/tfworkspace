variable "region" {
  description = "Region name"
  default     = "us-east"
}

variable "prefix" {
  default     = "tutorial"
  description = "The prefix string"
}

variable "ibm_resource_group" {
  default     = "Default"
  description = "IBM Cloud resource group name"
}

variable "count_mysql" {
  default = 1
  description = "the number of mysql instances"
}

variable "count_appserv" {
  default = 1
  description = "the number of appserv instances"
}
