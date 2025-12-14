provider "azurerm" {
    features {}  
}

provider "azuread" {
  
}

resource "azurerm_resource_group" "RGmamiluPet" {
  name = "RGmamiluPet"
  location = "East US"
}

resource "azurerm_container_registry" "ACRmamiluPet" {
  name = "ACRmamiluPet"
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  location = azurerm_resource_group.RGmamiluPet.location
  sku = "Standard"
}

resource "azurerm_app_service_plan" "PlanmamiluPet" {
  name = "servicePlanMamiluPet"
  location = azurerm_resource_group.RGmamiluPet.location
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "WebApp1" {
  name = "WebbApp1"
  location = azurerm_resource_group.RGmamiluPet.location
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  app_service_plan_id = azurerm_app_service_plan.PlanmamiluPet.id

  app_settings =  {  
    "mi_variable" = "valor1"
  }

}