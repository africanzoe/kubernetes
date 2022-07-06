variable "tags" {
  description = "The tags to associate with your network and subnets."
  default     = { "ENV" : "test" }
}

variable "route_tables_ids" {
  description = "A map of subnet name to Route table ids"
  default     = {}
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
  default     = "acctvnet"
}

variable "nsg_ids" {
  description = "A map of subnet name to Network Security Group IDs"
  default     = {}
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "A map of subnet name to enable/disable private link endpoint network policies on the subnet."
  default     = {}
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1", "subnet2", "subnet3"]
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnet_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  default     = {}
}

variable "subnet_delegation" {
  description = "A map of subnet name to delegation block on the subnet"
  default     = {}
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "subnet_enforce_private_link_service_network_policies" {
  description = "A map of subnet name to enable/disable private link service network policies on the subnet."
  default     = {}
}

variable "vnet_location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = "null"
}

