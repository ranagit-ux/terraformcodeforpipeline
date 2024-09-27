resource "azurerm_public_ip" "publicpipeline" {
    for_each = var.pip_var
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method


}