resource "azurerm_resource_group" "example" {
  name     = "aks-goof-k8s-resources"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "aks-goof-k8s"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "akf-goof-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
