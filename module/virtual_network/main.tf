resource "azurerm_virtual_network" "vnetpipeline" {
for_each = var.vent_var
    name= each.value.vnetname
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    address_space = each.value.address_space
  
}