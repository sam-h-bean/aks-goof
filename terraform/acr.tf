resource "azurerm_container_registry" "acr" {
  name                = "aksGoofRegistry"
  resource_group_name = azurerm_resource_group.aks_goof.name
  location            = azurerm_resource_group.aks_goof.location
  sku = "Premium"
  admin_enabled = true
}
