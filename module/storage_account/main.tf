resource "azurerm_storage_account" "pipelinestorage" {
    for_each = var.storage_var
    name= each.value.storagename
    location= each.value.location
    resource_group_name = each.value.resource_group_name
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
}