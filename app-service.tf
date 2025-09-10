# app-service.tf - App Service Configuration

# App Service Plan (FREE tier)
resource "azurerm_service_plan" "main" {
  name                = "asp-${var.project_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "F1"  # FREE tier

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Purpose     = "Host Snake Game with health monitoring"
  }
}

# App Service for Snake Game
resource "azurerm_linux_web_app" "snake_game" {
  name                = "app-${var.project_name}-snake-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    # Note: always_on not available in F1 (Free) tier
    
    application_stack {
      node_version = "18-lts"
    }

    # Health check configuration (we'll use this later)
    health_check_path = "/health"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.main.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.main.connection_string
    "SCM_DO_BUILD_DURING_DEPLOYMENT"       = "true"
    "WEBSITE_NODE_DEFAULT_VERSION"          = "18.17.1"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Purpose     = "Snake Game with Self-Healing Capabilities"
  }
}