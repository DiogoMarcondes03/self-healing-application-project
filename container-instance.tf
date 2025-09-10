# container-instance.tf - Azure Container Instance Configuration

# Container Group for Snake Game
resource "azurerm_container_group" "snake_game" {
  name                = "ci-${var.project_name}-snake-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "Public"
  dns_name_label      = "${var.project_name}-snake-${var.environment}-${random_integer.suffix.result}"
  os_type             = "Linux"

  container {
    name   = "snake-game-container"
    image  = "nginx:alpine"  # We'll use nginx to serve static files initially
    cpu    = "0.5"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }

    # Environment variables for Application Insights
    environment_variables = {
      "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.main.instrumentation_key
    }
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Purpose     = "Snake Game Container with Self-Healing"
  }
}

# Output the container URL
output "container_url" {
  description = "URL of the Snake Game container"
  value       = "http://${azurerm_container_group.snake_game.fqdn}"
}