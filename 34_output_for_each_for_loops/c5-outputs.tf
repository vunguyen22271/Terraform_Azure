# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  # Atrribute Reference
  value = azurerm_resource_group.myrg.id 
}
# output "resource_group_name" {
#   description = "Resource Group name"
#   # Argument Reference
#   value = azurerm_resource_group.myrg.name  
# }

# # 2. Output Values - Virtual Network
# output "virtual_network_name" {
#   description = "Virutal Network Name"
#   value = azurerm_virtual_network.myvnet.name 
# }


# Output - For Loop One Input and List Output with VNET Name 
output "virtual_network_name_list_one_input" {
  description = "Virutal Network Name"
  value = [ for vnet in azurerm_virtual_network.myvnet: vnet.name]
}

# Output - For Loop Two Inputs, List Output which is Iterator i (var.environment)
output "virtual_network_name_list_two_inputs" {
  description = "Virutal Network Name"
  #value = [ for i, vnet in azurerm_virtual_network.myvnet: i]
  value = [ for env, vnet in azurerm_virtual_network.myvnet: env]
}

# Output - For Loop One Input and Map Output with VNET ID and VNET Name
output "virtual_network_name_map_one_input" {
  description = "Virutal Network Name"
  value = {for vnet in azurerm_virtual_network.myvnet: vnet.id => vnet.name}
}

# Output - For Loop Two Inputs and Map Output with Iterator env and VNET Name
output "virtual_network_name_map_two_inputs" {
  description = "Virutal Network Name"
  value = {for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name}
}

# Terraform keys() function: keys takes a map and returns a list containing the keys from that map.
output "virtual_network_name_keys_function" {
  description = "Virutal Network Name - keys() Function Explore"
  value = keys({for vnet in azurerm_virtual_network.myvnet: vnet.id => vnet.name})
}

# Terraform values() function: values takes a map and returns a list containing the values of the elements in that map.
output "virtual_network_name_values_function" {
  description = "Virutal Network Name - values() Function Explore"
  value = values({for vnet in azurerm_virtual_network.myvnet: vnet.id => vnet.name})
}


# structure of azurerm_virtual_network.myvnet
# {
#   "dev2" = {
#     "address_space" = tolist([
#       "10.0.0.0/16",
#     ])
#     "bgp_community" = ""
#     "ddos_protection_plan" = tolist([])
#     "dns_servers" = tolist([])
#     "edge_zone" = ""
#     "flow_timeout_in_minutes" = 0
#     "guid" = "0bfcf63c-23f3-418e-b1b0-2092d02bbbcf"
#     "id" = "/subscriptions/7a70b68e-db53-4f72-b92d-0309864b1e4a/resourceGroups/it-rg/providers/Microsoft.Network/virtualNetworks/it-dev2-vnet"
#     "location" = "eastus"
#     "name" = "it-dev2-vnet"
#     "resource_group_name" = "it-rg"
#     "subnet" = toset([])
#     "tags" = tomap(null) /* of string */
#     "timeouts" = null /* object */
#   }
#   "prod2" = {
#     "address_space" = tolist([
#       "10.0.0.0/16",
#     ])
#     "bgp_community" = ""
#     "ddos_protection_plan" = tolist([])
#     "dns_servers" = tolist([])
#     "edge_zone" = ""
#     "flow_timeout_in_minutes" = 0
#     "guid" = "e7cc3496-28f8-4db0-a8fc-d9ce78372cc3"
#     "id" = "/subscriptions/7a70b68e-db53-4f72-b92d-0309864b1e4a/resourceGroups/it-rg/providers/Microsoft.Network/virtualNetworks/it-prod2-vnet"
#     "location" = "eastus"
#     "name" = "it-prod2-vnet"
#     "resource_group_name" = "it-rg"
#     "subnet" = toset([])
#     "tags" = tomap(null) /* of string */
#     "timeouts" = null /* object */
#   }
#   "qa2" = {
#     "address_space" = tolist([
#       "10.0.0.0/16",
#     ])
#     "bgp_community" = ""
#     "ddos_protection_plan" = tolist([])
#     "dns_servers" = tolist([])
#     "edge_zone" = ""
#     "flow_timeout_in_minutes" = 0
#     "guid" = "fade9a54-a35c-47d2-a398-074e9ee12f25"
#     "id" = "/subscriptions/7a70b68e-db53-4f72-b92d-0309864b1e4a/resourceGroups/it-rg/providers/Microsoft.Network/virtualNetworks/it-qa2-vnet"    "location" = "eastus"
#     "name" = "it-qa2-vnet"
#     "resource_group_name" = "it-rg"
#     "subnet" = toset([])
#     "tags" = tomap(null) /* of string */
#     "timeouts" = null /* object */
#   }
#   "staging2" = {
#     "address_space" = tolist([
#       "10.0.0.0/16",
#     ])
#     "bgp_community" = ""
#     "ddos_protection_plan" = tolist([])
#     "dns_servers" = tolist([])
#     "edge_zone" = ""
#     "flow_timeout_in_minutes" = 0
#     "guid" = "db634eeb-cdfc-4f80-ab68-0591ff8ecc21"
#     "id" = "/subscriptions/7a70b68e-db53-4f72-b92d-0309864b1e4a/resourceGroups/it-rg/providers/Microsoft.Network/virtualNetworks/it-staging2-vnet"
#     "location" = "eastus"
#     "name" = "it-staging2-vnet"
#     "resource_group_name" = "it-rg"
#     "subnet" = toset([])
#     "tags" = tomap(null) /* of string */
#     "timeouts" = null /* object */
#   }
# }