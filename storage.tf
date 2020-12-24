provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "sample-rg"
  location = "East US"
}

resource "azurerm_storage_account" "str" {
  name                     = "synechronterralab"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "folder" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.str.name
  container_access_type = "private"
}
