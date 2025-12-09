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
