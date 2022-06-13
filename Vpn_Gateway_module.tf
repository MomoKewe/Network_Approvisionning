/*resource "azurerm_key_vault_secret" "vpn-root-cert" { 
  depend_on=[ 
    azurerm_key_vault.vpn-kv, 
    azurerm_key_vault_secret.vpn-root-certificate 
  ]
  name = "vpn-root-certificate" 
  key_vault_id = azurerm_key_vault.vpn-kv.id
}


resource "azurerm_virtual_network_gateway" "myVPN" {
  name                = "myVPN"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    #public_ip_address_id          = azurerm_public_ip.myVnet.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.GatewaySubnet.id
  }

  vpn_client_configuration {
    address_space = ["10.2.0.0/24"]

    root_certificate { 
      name = "VPNROOT" 
      public_cert_data = data.azurerm_key_vault_secret.vpn-root-cert.value 
    }

  }
}*/