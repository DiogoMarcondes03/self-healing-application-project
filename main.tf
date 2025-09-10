# main.tf - Provider Configuration and Variables

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# Variables
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "selfhealing"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# Random suffix for unique naming
resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

# Get current client configuration
data "azurerm_client_config" "current" {}