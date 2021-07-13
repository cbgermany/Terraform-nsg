# Output the ID of the NSG that has been created
output "nsg_id" {
    value = azurerm_network_security_group.nsg.id
}
