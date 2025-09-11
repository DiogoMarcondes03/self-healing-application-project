# storage.tf - Storage Account Configuration with Static Website

resource "azurerm_storage_account" "main" {
  name                     = "st${var.project_name}${var.environment}${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Enable static website hosting
  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
    Purpose     = "Static website hosting and logs"
  }
}

# Upload your Snake Game files
resource "azurerm_storage_blob" "index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/snake-game/index.html"
  content_type           = "text/html"

  depends_on = [azurerm_storage_account.main]
}

resource "azurerm_storage_blob" "style_css" {
  name                   = "style.css"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/snake-game/style.css"
  content_type           = "text/css"

  depends_on = [azurerm_storage_account.main]
}

resource "azurerm_storage_blob" "script_js" {
  name                   = "script.js"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/snake-game/script.js"
  content_type           = "application/javascript"

  depends_on = [azurerm_storage_account.main]
}