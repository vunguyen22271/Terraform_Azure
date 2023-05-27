# terraform import azurerm_network_security_group.mynsg /subscriptions/7a70b68e-db53-4f72-b92d-0309864b1e4a/resourceGroups/rg-rpa-pro/providers/Microsoft.Network/networkSecurityGroups/nsg-rpa-pro001
# terraform state list
# terraform state show azurerm_network_security_group.mynsg
resource "azurerm_network_security_group" "mynsg" {
    name                = "nsg-rpa-pro001"
    location            = "australiaeast"
    resource_group_name = azurerm_resource_group.myrg.name
    security_rule       = [
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = ""
            destination_address_prefixes               = [
                "139.73.130.201",
                "139.73.130.203",
                "139.73.130.247",
                "139.73.130.249",
                "139.73.153.194",
            ]
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "3200-3399",
                "443",
                "80",
            ]
            direction                                  = "Outbound"
            name                                       = "AllowvNetToTelstra"
            priority                                   = 3500
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.0.0/16"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = ""
            destination_address_prefixes               = [
                "30.144.107.0/24",
                "30.144.109.0/24",
                "30.144.110.0/24",
                "30.144.12.0/24",
            ]
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowvNetToVPCDXC"
            priority                                   = 4000
            protocol                                   = "*"
            source_address_prefix                      = "40.144.0.0/16"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = ""
            destination_address_prefixes               = [
                "4.4.4.4",
                "8.8.8.8",
            ]
            destination_application_security_group_ids = []
            destination_port_range                     = "53"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "ConnecttoExternalDNS"
            priority                                   = 100
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.10.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = ""
            destination_address_prefixes               = [
                "40.144.1.0/24",
                "40.144.10.0/24",
                "40.144.100.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            destination_application_security_group_ids = []
            destination_port_range                     = "3389"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "Bastion_to_Subnets"
            priority                                   = 200
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.200.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "157.133.97.220"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "443",
                "80",
            ]
            direction                                  = "Outbound"
            name                                       = "AllowRuntimeAPPtoSapUAT"
            priority                                   = 200
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.1.0/24",
                "40.144.100.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "210.80.140.230"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "443",
                "80",
            ]
            direction                                  = "Outbound"
            name                                       = "AllowRuntimeAPPtoSapPROD"
            priority                                   = 300
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.1.0/24",
                "40.144.100.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.0.0/16"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowvNetTovNet"
            priority                                   = 4095
            protocol                                   = "*"
            source_address_prefix                      = "40.144.0.0/16"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.10.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "123",
                "137",
                "138",
                "389",
                "464",
                "53",
                "636",
                "88",
            ]
            direction                                  = "Inbound"
            name                                       = "App_To_AD_UDPs"
            priority                                   = 610
            protocol                                   = "Udp"
            source_address_prefix                      = "40.144.30.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.10.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "123",
                "137",
                "138",
                "389",
                "464",
                "53",
                "636",
                "88",
            ]
            direction                                  = "Inbound"
            name                                       = "DB_To_AD_UDPs"
            priority                                   = 710
            protocol                                   = "Udp"
            source_address_prefix                      = "40.144.20.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.10.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "123",
                "137",
                "138",
                "389",
                "464",
                "53",
                "636",
                "88",
            ]
            direction                                  = "Inbound"
            name                                       = "Runtime_To_AD_UDPs"
            priority                                   = 510
            protocol                                   = "Udp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.1.0/24",
                "40.144.100.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.10.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "135",
                "139",
                "3268",
                "3269",
                "389",
                "445",
                "464",
                "49152-65535",
                "53",
                "593",
                "636",
                "88",
            ]
            direction                                  = "Inbound"
            name                                       = "DB_To_AD_TCPs"
            priority                                   = 700
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.20.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.10.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "135",
                "139",
                "3268",
                "3269",
                "389",
                "445",
                "464",
                "49152-65535",
                "53",
                "593",
                "636",
                "88",
            ]
            direction                                  = "Inbound"
            name                                       = "Runtime_To_AD_TCPs"
            priority                                   = 500
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.1.0/24",
                "40.144.100.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.10.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "135",
                "139",
                "3268",
                "389",
                "445",
                "464",
                "49152-65535",
                "53",
                "593",
                "636",
                "88",
            ]
            direction                                  = "Inbound"
            name                                       = "App_To_AD_TCPs"
            priority                                   = 600
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.30.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.20.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "1433"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "App_To_DBSubnet_1433"
            priority                                   = 300
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.30.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.20.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "1434"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "App_To_DBSubnet_1434"
            priority                                   = 301
            protocol                                   = "Udp"
            source_address_prefix                      = "40.144.30.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.30.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "8181",
                "8199",
                "8200",
                "8201",
            ]
            direction                                  = "Inbound"
            name                                       = "Runtime_To_App"
            priority                                   = 400
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.1.0/24",
                "40.144.100.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "40.144.30.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "3389"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "VPNClienttoApp"
            priority                                   = 350
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.251.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "AzureActiveDirectory"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowADAPPDBtoAAD"
            priority                                   = 4090
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.10.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "AzureMonitor"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowADAPPDBtoAzureMonitor"
            priority                                   = 4086
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.10.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "AzureSiteRecovery"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowADAPPDBtoAzureSiteRecovery"
            priority                                   = 4087
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.10.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "EventHub.AustraliaSoutheast"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowADAPPDBtoEventHub"
            priority                                   = 4088
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.10.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "GuestAndHybridManagement"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowGuestHybridReport"
            priority                                   = 400
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.20.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "Internet"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowRuntimeToInternet"
            priority                                   = 4094
            protocol                                   = "*"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.1.0/24",
                "40.144.10.0/24",
                "40.144.100.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "Storage"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowAzureStorage"
            priority                                   = 102
            protocol                                   = "Tcp"
            source_address_prefix                      = "40.144.20.0/24"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "Storage.AustraliaEast"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "443",
                "445",
            ]
            direction                                  = "Outbound"
            name                                       = "TESTFileshare"
            priority                                   = 101
            protocol                                   = "*"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "Storage.AustraliaSoutheast"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "AllowADAPPDBtoStorageRecovery"
            priority                                   = 4089
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "40.144.10.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = "Transition Phase Only"
            destination_address_prefix                 = "40.144.0.0/16"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "VPC_to_vNet"
            priority                                   = 100
            protocol                                   = "*"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "30.144.107.0/24",
                "30.144.109.0/24",
                "30.144.110.0/24",
                "30.144.12.0/24",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = "Via Telstra Firewall"
            destination_address_prefix                 = "40.144.1.0/24"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = ""
            destination_port_ranges                    = [
                "3200-3399",
                "433",
                "80",
            ]
            direction                                  = "Inbound"
            name                                       = "SAP_To_Runtime"
            priority                                   = 450
            protocol                                   = "Tcp"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "139.73.130.201",
                "139.73.130.203",
                "139.73.130.247",
                "139.73.130.249",
                "139.73.153.194",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Deny"
            description                                = ""
            destination_address_prefix                 = ""
            destination_address_prefixes               = [
                "40.144.10.0/24",
                "40.144.100.0/24",
                "40.144.20.0/24",
                "40.144.30.0/24",
            ]
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "DenySAP_to_DB_App"
            priority                                   = 4096
            protocol                                   = "*"
            source_address_prefix                      = ""
            source_address_prefixes                    = [
                "139.73.130.201",
                "139.73.130.203",
                "139.73.130.247",
                "139.73.130.249",
                "139.73.153.194",
            ]
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Deny"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "*"
            destination_port_ranges                    = []
            direction                                  = "Outbound"
            name                                       = "DenyAllOutBoundFromRPAInternet"
            priority                                   = 4096
            protocol                                   = "*"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
    ]
}