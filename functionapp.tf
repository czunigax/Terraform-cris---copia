resource "azurerm_linux_function_app" "serverless" {
    name                      = "serverless-${var.name_Project}-${var.enviroment}"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.rg.name
    storage_account_name      = azurerm_storage_account.sacount2.name
    storage_account_access_key= azurerm_storage_account.sacount2.primary_access_key

    service_plan_id           = azurerm_service_plan.sp.id
  
  site_config {
    
  }
}