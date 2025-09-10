# storage.tf - Storage Account Configuration

resource "azurerm_storage_account" "main" {
  name                     = "st${var.project_name}${var.environment}${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
    Purpose     = "Logs and diagnostic storage"
  }
}