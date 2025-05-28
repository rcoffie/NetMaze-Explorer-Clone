param location string = resourceGroup().location
param vnetName string = 'vnetEast'
param addressSpace string = '10.0.0.0/16'
param webAppSubnetName string = 'webAppSubnet'
param webSubnetPrefix string = '10.0.1.0/24'
param gatewaySubnetName string = 'GatewaySubnet'
param gatewaySubnetPrefix string = '10.0.2.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSpace
      ]
    }
  }
}

resource webAppsubnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  parent: vnet
  name: webAppSubnetName
  properties: {
    addressPrefix: webSubnetPrefix
  }
}

resource gatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  parent: vnet
  name: gatewaySubnetName
  properties: {
    addressPrefix: gatewaySubnetPrefix
  }
}

output vnetResourceId string = vnet.id
output webAppSubnetId string = webAppsubnet.id
output gatewaySubnetId string = gatewaySubnet.id
