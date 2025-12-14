provider "azurerm" {
  features {}
}

provider "azuread" {

}

resource "azurerm_resource_group" "RGmamiluPet" {
  name     = "RGmamiluPet"
  location = "East US"
}

resource "azurerm_container_registry" "ACRmamiluPet" {
  name                = "ACRmamiluPet"
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  location            = azurerm_resource_group.RGmamiluPet.location
  sku                 = "Standard"
}

resource "azurerm_app_service_plan" "PlanmamiluPet" {
  name                = "servicePlanMamiluPet"
  location            = azurerm_resource_group.RGmamiluPet.location
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_linux_web_app" "WebApp1" {
  name                = "WebbApp1"
  location            = azurerm_resource_group.RGmamiluPet.location
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  service_plan_id     = azurerm_app_service_plan.PlanmamiluPet.id
  site_config {

  }
  app_settings = {
    "variable" = "valor1"
 }
}