param location string = 'westus'
param addressSpace string = '10.1.0.0/16'
param defaultSubnetName string = 'defaultSubnet'
param defaultSubnetPrefix string = '10.1.0.0/24'
param vnetName string = 'vnetWest'

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

resource defaultSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  parent: vnet
  name: defaultSubnetName
  properties: {
    addressPrefix: defaultSubnetPrefix
  }
}

output vnetResourceId string = vnet.id
output defaultSubnetId string = defaultSubnet.id
