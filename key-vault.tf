# key-vault.tf - Key Vault Configuration

resource "azurerm_key_vault" "main" {
  name                = "kv-${var.project_name}-${var.environment}-${random_integer.suffix.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  
  # Add these properties to handle deleted vaults
  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  # Access policy for current user
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "List",
      "Purge",
      "Recover",  # Added this permission
    ]
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Purpose     = "Secure storage for secrets and certificates"
  }
}

# Store Application Insights connection string in Key Vault
# Commented out to avoid permission issues for now
# resource "azurerm_key_vault_secret" "app_insights_connection_string" {
#   name         = "app-insights-connection-string"
#   value        = azurerm_application_insights.main.connection_string
#   key_vault_id = azurerm_key_vault.main.id
# 
#   depends_on = [
#     azurerm_key_vault.main
#   ]
# }