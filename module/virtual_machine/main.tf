resource "azurerm_network_interface" "nicpipeline" {
  for_each            = var.vm_var
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {

    name      = each.value.ipname
    subnet_id = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.datapublic[each.key].id
  }

}
resource "azurerm_linux_virtual_machine" "vmpipeline" {
  for_each                        = var.vm_var
  name                            = each.value.vmname
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password

  network_interface_ids           = [azurerm_network_interface.nicpipeline[each.key].id]

 disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
