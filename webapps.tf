resource "azurerm_service_plan" "sp" {
    name = "sp-${var.name_Project}-${var.enviroment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"
    tags = var.tags
}

resource "azurerm_linux_web_app" "webappui" {
    name = "gui-${var.name_Project}-${var.enviroment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.sp.id

    site_config  {
        always_on = false
        application_stack {
            docker_registry_url = "https://index.docker.io/v1/"
            docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITE_PORT ="88"
    }

  
}

resource "azurerm_linux_web_app" "webapp_admin"{
    name = "admin-${var.name_Project}-${var.enviroment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.sp.id

    site_config  {
        always_on = false
        application_stack {
            docker_registry_url = "https://index.docker.io/v1/"
            docker_image_name = "org/admin-api:latest" #(reemplazar con la imagen de la API)
        }
    }

    app_settings = {
        WEBSITE_PORT ="5000" #Puerto de la API
    }
    
    tags = var.tags
}