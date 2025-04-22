provider "azurerm"{
    subscription_id =var.subscription_id
    features  {}
}    
resource "azurerm_resource_group" "rg"{
     name = "rg-${var.name_Project}-${var.enviroment}"
     location = var.location

     tags = var.tags
 
    }
