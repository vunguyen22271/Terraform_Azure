# Input Variables

# 1. Business Unit Name

variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "hr"
}

# 2. environment Name
variable "environment" {
  description = "environment Name"
  type = string
  default = "dev"
}

# 3. Resource Group Name
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "myrg"
}

# contains example
# 4. Resource Group Location
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "eastus"
  validation {
    condition  = var.resoure_group_location == "eastus" || var.resoure_group_location == "eastus2"
    #condition = contains(["eastus", "eastus2"], lower(var.resoure_group_location))
    error_message = "We only allow Resources to be created in eastus or eastus2 Locations."
  }  
}

# # regex example
# # 4. Resource Group Location
# variable "resoure_group_location" {
#   description = "Resource Group Location"
#   type = string
#   default = "eastus"
#   validation {
#     condition = can(regex("india$", var.resoure_group_location))
#     error_message = "We only allow Resources to be created in westindia and southindia locations."
#   }  
# }

# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "myvnet"
}

# 6. Subnet Name: Assign When Prompted using CLI
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string 
}

# 7. Virtual Network address_space
variable "virtual_network_address_space" {
  description = "Virtual Network Address Space"
  type = list(string)
  default = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

# 8. Public IP SKU
variable "public_ip_sku" {
  description = "Azure Public IP Address SKU"
  type = map(string)
  default = {
    "eastus" = "Basic"
    "eastus2" = "Standard" 
  }
}

# 9. Common Tags
variable "common_tags" {
  description = "Common Tags for Azure Resources"
  type = map(string)
  default = {
    "CLITool" = "Terraform"
    "Tag1" = "Azure"
  } 
}