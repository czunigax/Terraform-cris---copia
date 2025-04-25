resource "azurerm_service_plan" "sp" {
    name = "sp-${var.name_Project}-${var.enviroment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"
    tags = var.tags
}


resource "azurerm_linux_web_app" "webappui" {
  name                = "pokeui-${var.name_Project}-${var.enviroment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id

  # Configuración clave para usar tu imagen personalizada
  site_config {
    always_on = false
    application_stack {
      docker_image_name = "acrproyecto2dv.azurecr.io/pikachu-ui:latest"

    }
  }

  # Variables críticas para Next.js
  app_settings = {
    WEBSITES_PORT      = "3000"  # ¡Obligatorio para Next.js!
    

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
           docker_image_name = "acrproyecto2dv.azurecr.io/proyecto-pikachu:latest"

        }
    }
   app_settings = {
    WEBSITE_PORT = "8000",  # Puerto de la API

   }

  tags = var.tags
}