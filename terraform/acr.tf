resource "azurerm_container_registry" "acr" {
  name                = "aks-goof-registry"
  resource_group_name = azurerm_resource_group.aks_goof.name
  location            = azurerm_resource_group.aks_goof.location
}
