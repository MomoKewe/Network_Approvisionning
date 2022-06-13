resource "azurerm_public_ip" "mypip" {
  name                = "mypip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "myGate" {
  name                = "myGat"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.mypip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.GatewaySubnet.id
  }

  vpn_client_configuration {
    address_space = ["10.2.0.0/24"]

    root_certificate {
      name = "RootCert"

      public_cert_data = <<EOF
MIIC8zCCAdugAwIBAgIQRQrmDYM5MadJgO2RX1+5qTANBgkqhkiG9w0BAQsFADAc
MRowGAYDVQQDDBFLb3BpQ2xvdWRSb290Q2VydDAeFw0yMjA1MTkxMzM5MDFaFw0y
MzA1MTkxMzU5MDFaMBwxGjAYBgNVBAMMEUtvcGlDbG91ZFJvb3RDZXJ0MIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3mA4jnkbxyElBf73fONsqJqUZRzT
JEUZBSsMKkITdOpzWQWZur9+AU6dZcUXvtRAxFevZh+5F0r2x7MYIoSw2aHNhT2X
ZXq5Nbv8t00kHGExzteTMd6UXHvMdVmJPoeRwqCElq8I2pk7mJRLOku+gZoYu367
bc5seDXCNykXRhU0Bpjpsj15KpyO68m4/RduIV/jmXF3LMR+1VjFBZRMb6XG1vyM
tE4LfHj2lCiyamIDkEsUZ8l0DAMspcZVTxwsES4h9Qs0UaVt6CEqd8zDtkq3qhii
naM46kB0TdaZplUz7GQbKNXuNSDsZ6v5104GfQyboL3fOiEv8SoYfTZqzQIDAQAB
ozEwLzAOBgNVHQ8BAf8EBAMCAgQwHQYDVR0OBBYEFOvm76fffb7C7zJaCBRZp09r
v0EcMA0GCSqGSIb3DQEBCwUAA4IBAQB0Rjce+CqNJenE5sl4BEck2B94++nMfoET
ciSqGmezIswTsrUx+h/FmIqqkAGCD2UGngqmB30YCQZs/aiRmD7EJ+Y52E2I6cbu
LiZvi+UY/SJkg/C2Ne5BxTGZqSn6IixaKVD2kUTyJF6zb53WxPmnPM0G7FxgisEe
ZHjFLTJgrM+6UFqlutcRIMz4kwRi18rimGpqfENH/eDeZlgJ2t2g9awti7X9CX7i
yqjX557KWcZ653yaeLArZ/GAp74xeq5QHuPFi+hHv/TKaPSeMq75DTsuvIP5mrk0
p4Z2okmDJiBCuud6w8ZtT5MRORgdlVKBcTN2RWTq/Q/lnH0/Jkf8
EOF

    }

    revoked_certificate {
      name       = "Verizon-Global-Root-CA"
      thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1"
    }
  }
}
