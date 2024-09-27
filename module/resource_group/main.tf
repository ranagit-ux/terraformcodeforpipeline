resource "azurerm_resource_group" "pipelinerg" {
for_each = var.rg_var
    name = each.value.rgname
    location=each.value.location

}