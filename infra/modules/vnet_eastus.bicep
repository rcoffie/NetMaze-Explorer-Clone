param location string = resourceGroup().location
param vnetName string = 'myVnet'
param addressSpace string = '10.0.0.0/16'
param webAppSubnetName string = 'webAppSubnet'
param webSubnetPrfix string = '10.0.1.0/24'
param gatewaySubnetName string = 'GatewaySubnet'
param gatewaySubnetPrefix  string = '10.0.2.0/16'

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
  name: webAppSubnetName
  properties: {
    addressPrefix: webSubnetPrfix
  }
  dependsOn: [
    vnet
  ]
}

resource gatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  name: gatewaySubnetName
  properties: {
    addressPrefix: gatewaySubnetPrefix
  }
  dependsOn: [
    vnet
  ]
}




output vnetResourceId string = vnet.id
output webAppSubnetid string = webAppsubnet.id
output gatewaySubnetid string = gatewaySubnet.id
