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

resource "azurerm_service_plan" "PlanmamiluPet" {
  name                = "servicePlanMamiluPet"
  location            = azurerm_resource_group.RGmamiluPet.location
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-mamilupet" {
  name                = "webapp-mamilupet"
  location            = azurerm_resource_group.RGmamiluPet.location
  resource_group_name = azurerm_resource_group.RGmamiluPet.name
  service_plan_id     = azurerm_service_plan.PlanmamiluPet.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variable" = "valor1"
 }
}

