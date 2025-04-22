resource azurerm_container_registry "acr" {
    name = "acr${var.name_Project}${var.enviroment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    sku = "Basic"
    admin_enabled = true

    tags = var.tags
}