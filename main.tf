# Create the Network Security Group Role
resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  tags = merge(
    var.common_tags,
    tomap(
      {"Component" = "NSG"}
    )
  )   
}

# Create the Network Security Group Rules
resource "azurerm_network_security_rule" "nsg_rule" {
  for_each = var.nsg_rules
    name                        = each.key
    priority                    = each.value.priority
    direction                   = each.value.direction
    access                      = each.value.access
    protocol                    = each.value.protocol
    source_port_range           = each.value.source_port_range
    destination_port_range      = each.value.destination_port_range
    source_address_prefix       = each.value.source_address_prefix
    destination_address_prefix  = each.value.destination_address_prefix
    resource_group_name         = var.resource_group
    network_security_group_name = azurerm_network_security_group.nsg.name
}

