resource "azurerm_subnet" "subnetpipeline" {
for_each = var.subnet_var
    name= each.value.subnetname
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
    address_prefixes = each.value.address_prefixes
  
}