resource "azurerm_resource_group" "aks_goof" {
  name     = "aks-goof-k8s-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks_goof" {
  name                = "aks-goof-k8s"
  location            = azurerm_resource_group.aks_goof.location
  resource_group_name = azurerm_resource_group.aks_goof.name
  dns_prefix          = "akf-goof-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
}
