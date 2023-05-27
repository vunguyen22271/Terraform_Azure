provider "azurerm" {
  features {
    
  }
}

resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  numeric = false
}

resource "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name

  location = var.location
  account_tier = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind = var.storage_account_kind

  static_website {
    index_document = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }
  lifecycle {
    replace_triggered_by = [
      aws_ecs_service.svc.id
    ]
  }
}