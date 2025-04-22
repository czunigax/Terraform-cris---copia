resource "azurerm_storage_account" "sacount" {
    name = "st${var.name_Project}${var.enviroment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    

    tags = var.tags
  
}

resource "azurerm_storage_account" "sacount2" {
    name = "st${var.name_Project}fnstt${var.enviroment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    

    tags = var.tags
  
}

resource "azurerm_storage_account_static_website" "static_site" {
  storage_account_id = azurerm_storage_account.sacount.id

  index_document     = "index.html"
  error_404_document = "404.html"
}

resource "azurerm_storage_container" "contenedor1" {
  
  name = "reportes"
  container_access_type = "private"
  storage_account_id = azurerm_storage_account.sacount.id
  }

resource "azurerm_storage_queue" "q1" {
    name = "request"
    storage_account_name = azurerm_storage_account.sacount.name
}
