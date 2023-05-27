# Call our Custom Terraform Module which we built earlier
module "azure_static_website" {
  source = "./modules/azure-static-website" # Mandatory

  # Resource Group
  location = var.location
  resource_group_name               = var.resource_group_name

  # Storage Account
  storage_account_name              = "${var.storage_account_name}"
  storage_account_tier              = var.storage_account_tier
  storage_account_replication_type  = var.storage_account_replication_type
  storage_account_kind              = var.storage_account_kind
  static_website_index_document     = var.static_website_index_document
  static_website_error_404_document = var.static_website_error_404_document
}