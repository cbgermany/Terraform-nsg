variable "name" {
  description = "The name of the Network Security Group"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource grouo where the NSG will be created"
  type        = string
}

variable "location" {
  description = "The location where the Network Resource Group will be created"
  type        = string
}

variable "nsg_rules" {
  description = "A map of the nsg rules to be applied to the Network Security Group"
  type        = map(object({
    priority                    = string
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
  default     = {}
}

variable "common_tags" {
  description = "A Map of common tags to assign to the network security group"
  type        = map(string)
  default     = {}
}
