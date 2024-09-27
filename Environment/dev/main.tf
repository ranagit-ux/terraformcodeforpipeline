module "Resource_group" {
    source = "../../module/resource_group"
    rg_var=var.rg
  
}
module "Storage_account" {
    depends_on = [ module.Resource_group ]
    source = "../../module/storage_account"
  storage_var=var.newstorage
}