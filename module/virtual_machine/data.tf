data "azurerm_subnet" "datasubnet" {
    for_each = var.vm_var
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "datapublic" {
for_each = var.vm_var
  name                = each.value.ipname
  resource_group_name = each.value.resource_group_name
} 